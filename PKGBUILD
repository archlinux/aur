# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-cocotb-bus
pkgver=0.1
pkgrel=1
pkgdesc="Pre-packaged testbenching tools and reusable bus interfaces for cocotb"
arch=('any')
url="https://github.com/cocotb/cocotb-bus/"
license=('BSD')
depends=('python' 'python-setuptools')

makedepends=('git' 'gcc')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=("git+https://github.com/cocotb/cocotb-bus#tag=v${pkgver}.${pkgrel}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/cocotb-bus"
    python setup.py build
}

package() {
    cd "${srcdir}/cocotb-bus"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
