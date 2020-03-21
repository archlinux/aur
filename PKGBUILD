# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-cocotb
pkgver=1.3
pkgrel=1
pkgdesc="Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python"
arch=('any')
url="http://github.com/cocotb/cocotb/"
license=('BSD')
conflicts=('python-cocotb')
provides=('python-cocotb')
depends=('python')

makedepends=('git' 'python-setuptools')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=("git+https://github.com/cocotb/cocotb#tag=v${pkgver}.${pkgrel}")
md5sums=('SKIP')

package() {
    cd "${srcdir}/cocotb"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
