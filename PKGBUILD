# Maintainer: Scott Lill <dev at scottlill dot com>

pkgname='gnome-shell-extension-wallpaper-slideshow'
pkgver=13.2
pkgrel=1
pkgdesc='Wallpaper slideshow extension for GNOME'
arch=('any')
url='https://gitlab.com/AndrewZaech/azwallpaper'
license=('GPL-2.0-or-later')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/azwallpaper-v${pkgver}.tar.gz")
sha256sums=('b7397b0620c42bfc7b1aa304febf2c6fe51ad6bd8088063f69f7e2dab079db23')

build() {
	cd azwallpaper-v${pkgver}
	make VERSION=$pkgver
}

package() {
	cd azwallpaper-v${pkgver}
	make install DESTDIR=$pkgdir VERSION=$pkgver
}
