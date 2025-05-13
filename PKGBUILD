# Maintainer: Scott Lill <dev at scottlill dot com>

pkgname='gnome-shell-extension-wallpaper-slideshow'
pkgver=12
_commit="3c080eae5c6f2ecd3b66c2c11ad753805f44d374"
pkgrel=1
pkgdesc='Wallpaper slideshow extension for GNOME'
arch=('any')
url='https://gitlab.com/AndrewZaech/azwallpaper'
license=('GPL-3.0')
depends=('gnome-shell')
source=("azwallpaper-v${pkgver}::git+${url}.git#commit=${_commit}")
sha256sums=('a8293b9ab3e68f997900fe87135d030230de496083c6372616ae922ce16c8dd0')

build() {
	cd azwallpaper-v${pkgver}
	make VERSION=$pkgver
}

package() {
	cd azwallpaper-v${pkgver}
	make install DESTDIR=$pkgdir VERSION=$pkgver
}
