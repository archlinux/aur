# Maintainer: Iván Zaera Avellón <izaera at gmx dot es>
pkgname=joshi
pkgdesc="JavaScript Oriented Shell Interpreter"
pkgver=1.7.0
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
sha256sums=("68f3c15b75944a33cc6384f09a78c512e8665cf6fdae7f0ab7ecd7b1c5723ee7")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make clean
	make compile docs
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" make install
}
