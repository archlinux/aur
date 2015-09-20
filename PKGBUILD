# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Lazaros Koromilas <lostd@2f30.org>

pkgname=nausea
pkgver=0.3
pkgrel=2
pkgdesc="curses audio visualizer"
arch=('i686' 'x86_64')
url="http://git.2f30.org/nausea/"
license=('BSD')
depends=('ncurses' 'fftw')
conflicts=('nausea-git')
source=(http://dl.2f30.org/releases/$pkgname-$pkgver.tar.gz)
md5sums=('76406421e1ca2d64c8db29eabe5babf0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
