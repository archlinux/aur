# Maintainer: Iván Zaera Avellón <izaera at gmx dot es>
pkgname=joshi
pkgdesc="JavaScript Oriented Shell Interpreter"
pkgver=1.8.0
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
	'python2'
	'sed'
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/izaera/joshi/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("704ffac86f3e93aa07dbb3a659bc58711c9d754f110f9fd95360465e85cd5f12")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make clean
	make compile docs
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" make install
}
