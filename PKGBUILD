# Maintainer: mox <demox@lavabit.com>
pkgname=cocotb
pkgver=1.1
pkgrel=1
epoch=0
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('x86_64') # Can probably support other architectures as well, try your luck?
url="http://potential.ventures/cocotb/"
license=('BSD')
#groups=()
depends=('python' 'swig')
makedepends=('git')
#checkdepends=()
optdepends=('iverilog: for simulating verilog designs' 'ghdl: for simulating VHDL designs')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
install=${pkgname}.install
#changelog=
source=("https://github.com/potentialventures/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('94483fb042f9b645acecdfab20d460a4')
#validpgpkeys=()


#check() {
#	cd "$pkgname-$pkgver"
#	make test # currently fails, see https://github.com/potentialventures/cocotb/issues/833
#}

package() {
	cd "$pkgname-$pkgver"

	make INSTALL_DIR="$pkgdir/usr/local" install
	rm -r "$pkgdir/usr/local/cocotb-1.1.0/bin"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

