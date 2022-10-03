# Maintainer: Iván Zaera Avellón <izaera at gmx dot es>
pkgname=joshi
pkgdesc="JavaScript Oriented Shell Interpreter"
pkgver=1.8.2
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
	'dbus'
	'gcc'
	'git'
	'make'
	'nodejs'
	'npm'
	'python'
	'sed'
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/izaera/joshi/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("4eca131cc44e2cd8eedd848a6b2ef7453a92236c50daf35b9670439891ad8a3c")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make clean
	make compile docs
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" make install
}
