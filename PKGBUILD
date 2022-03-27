# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=aobook
pkgver=2.0.2
pkgrel=1
pkgdesc='Aozora Bunko text viewer'
arch=('x86_64')
url="http://azsky2.html.xdomain.jp/soft/aobook.html"
license=('MIT')
depends=('fontconfig' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxcursor' 'libxext')
source=("https://gitlab.com/azelpg/aobook/-/archive/v${pkgver}/aobook-v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/aobook-v${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/aobook-v${pkgver}"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('9502b965d8b34837c2057f70df7ab607')
