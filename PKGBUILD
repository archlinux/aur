# Maintainer: Scott Lill <dev at scottlill dot com>

pkgname='gnome-shell-extension-wallpaper-slideshow'
pkgver=9
pkgrel=1
pkgdesc='Wallpaper slideshow extension for GNOME'
arch=('any')
url='https://gitlab.com/AndrewZaech/azwallpaper'
license=('GPL-3.0')
depends=('gnome-shell')
source=("${url}/-/archive/v${pkgver}/azwallpaper-v${pkgver}.tar.gz")
sha256sums=('ed9f5d9ba4c84c321d53dc052f3dc9996fc700c8c2ec89a5938bae3a5bcf2f6d')

build() {
	cd azwallpaper-v${pkgver}
	make VERSION=$pkgver
}

package() {
	cd azwallpaper-v${pkgver}
	make install DESTDIR=$pkgdir VERSION=$pkgver
}
