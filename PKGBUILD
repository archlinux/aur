# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=aobook
pkgver=1.0.4
pkgrel=1
pkgdesc='Aozora Bunko text viewer'
arch=('i686' 'x86_64')
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

md5sums=('e81476f010c3dd1fe6be9c9969cbfc35')
