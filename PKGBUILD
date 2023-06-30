# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=aobook
pkgver=2.0.3
pkgrel=1
pkgdesc='Aozora Bunko text viewer'
arch=('x86_64')
url="http://azsky2.html.xdomain.jp/soft/aobook.html"
license=('MIT')
depends=('fontconfig' 'hicolor-icon-theme' 'libjpeg-turbo' 'libxcursor' 'libxext')
makedepends=('ninja')
source=("https://gitlab.com/azelpg/aobook/-/archive/v${pkgver}/aobook-v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/aobook-v${pkgver}"
	./configure --prefix=/usr
	cd build
	ninja
}

package() {
	cd "${srcdir}/aobook-v${pkgver}/build"
	DESTDIR="$pkgdir" ninja install
	install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

md5sums=('adce15a25d04e7c28a6b99abfd86ab37')
