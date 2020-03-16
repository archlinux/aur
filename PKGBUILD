# Maintainer: mox <demox@lavabit.com>
pkgname=cocotb
pkgver=1.3
pkgrel=1
epoch=0
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('x86_64') # Can probably support other architectures as well, try your luck?
url="http://github.com/cocotb/cocotb/"
license=('BSD')
conflicts=('cocotb')
provides=('cocotb')
depends=('python')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

install=${pkgname}.install
source=("https://github.com/cocotb/$pkgname/archive/v$pkgver.$pkgrel.tar.gz")
md5sums=('0d9dd62350649c91c9a4fa202ad20dda')

package() {
    cd "${srcdir}/cocotb-$pkgver.$pkgrel"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
