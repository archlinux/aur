# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=aobook
pkgver=2.0.0
pkgrel=1
pkgdesc='Aozora Bunko text viewer'
arch=('x86_64')
url="http://azsky2.html.xdomain.jp/soft/aobook.html"
license=('MIT')
depends=('fontconfig' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxext')
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

md5sums=('435c4eb3fd887468d63ca1252805df01')
