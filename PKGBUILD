# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=aobook
pkgver=2.0.1
pkgrel=1
pkgdesc='Aozora Bunko text viewer'
arch=('x86_64')
url="http://azsky2.html.xdomain.jp/soft/aobook.html"
license=('MIT')
depends=('fontconfig' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxcursor' 'libxext')
source=("http://azsky2.html.xdomain.jp/arc/aobook-${pkgver}.tar.xz")

build() {
	cd "${srcdir}/aobook-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/aobook-${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('5c98b45bc52ed844957034b9cecc8941')
