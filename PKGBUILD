# Maintainer: Brian Derr <brian at derrclan dot com>
pkgname=braincurses
pkgver=1.1.0
pkgrel=1
pkgdesc="A version of the classic game Mastermind."
arch=('x86_64' 'i686')
url="https://github.com/bderrly/braincurses"
license=('GPL')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bderrly/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7cdf11bbe53e813c4ef9fd495c282c74')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -D braincurses "${pkgdir}/usr/bin/${pkgname}"
}
