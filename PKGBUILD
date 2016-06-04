# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=aobook
pkgver=1.0.2
_sfver=65908
pkgrel=1
pkgdesc='Aozora Bunko text viewer'
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/aobook/"
license=('BSD')
depends=('fontconfig' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxext')
source=("http://dl.osdn.jp/aobook/${_sfver}/aobook-${pkgver}.tar.bz2")

build() {
	cd "${srcdir}/aobook-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/aobook-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('78fcb9c6adb7dda8ed1d2c79450fd032')
