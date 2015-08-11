# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=aobook
pkgver=1.0.1
_sfver=62557
pkgrel=1
pkgdesc='Aozora Bunko text viewer'
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/aobook/"
license=('BSD')
depends=('fontconfig' 'hicolor-icon-theme' 'libjpeg-turbo' 'libx11' 'libxext' 'xdg-utils')
install=aobook.install
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

md5sums=('48965417717ee70ad95b8b06b36e076b')
