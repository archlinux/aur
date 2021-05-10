# Maintainer: Iván Zaera Avellón <izaera at gmx dot es>
pkgname=joshi
pkgdesc="JavaScript Oriented Shell Interpreter"
pkgver=1.6.0
pkgrel=1
arch=('any')
url="https://github.com/izaera/joshi"
license=('GPL3')
depends=(
	'glibc'
	'libxcrypt'
)
optdepends=(
	'ncurses: terminal support'
)
makedepends=(
	'binutils'
	'coreutils'
	'curl'
	'gcc'
	'git'
	'make'
	'nodejs'
	'python2'
	'sed'
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/izaera/joshi/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("067cc765be7ee0edbed1077e727a0fc95934660f3d85cd867d678e340ecc2619")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make clean
	make compile docs
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" make install
}
