# Maintainer: Iván Zaera Avellón <izaera at gmx dot es>
pkgname=joshi
pkgdesc="JavaScript Oriented Shell Interpreter"
pkgver=1.8.1
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
sha256sums=("c34ad1eac9501072df4e1e2203a37d14490ace4d9d6ac55405383430fb2d0d06")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make clean
	make compile docs
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	PREFIX="$pkgdir/usr" make install
}
