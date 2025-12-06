# Maintainer: Scott Lill <dev at scottlill dot com>

pkgname='gnome-shell-extension-wallpaper-slideshow'
pkgver=14.0
pkgrel=1
pkgdesc='Wallpaper slideshow extension for GNOME'
arch=('any')
url='https://gitlab.com/AndrewZaech/azwallpaper'
license=('GPL-2.0-or-later')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/azwallpaper-v${pkgver}.tar.gz")
sha256sums=('f68ec37f2d17801511f2ee9d2cd9dfc02f9cd3027eb9976acb1617630612b082')

build() {
	cd azwallpaper-v${pkgver}
	make VERSION=$pkgver
}

package() {
	cd azwallpaper-v${pkgver}
	make install DESTDIR=$pkgdir VERSION=$pkgver
}
