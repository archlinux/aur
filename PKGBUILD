# Maintainer: mox <demox@lavabit.com>
pkgname=cocotb
pkgver=1.3
pkgrel=0
epoch=0
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('x86_64') # Can probably support other architectures as well, try your luck?
url="http://github.com/cocotb/cocotb/"
license=('BSD')
#groups=()
depends=('python')
makedepends=('git' 'python-setuptools')
#checkdepends=()
optdepends=('iverilog: for simulating verilog designs' 'ghdl: for simulating VHDL designs')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
install=${pkgname}.install
#changelog=
source=("https://github.com/cocotb/$pkgname/archive/v$pkgver.$pkgrel.tar.gz")
md5sums=('4db3d270943da293cf4dd7ce22594307')
#validpgpkeys=()


#check() {
#	cd "$pkgname-$pkgver"
#	make test # currently fails, see https://github.com/potentialventures/cocotb/issues/833
#}

package() {
    cd "${srcdir}/cocotb"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
