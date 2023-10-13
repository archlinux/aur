# Maintainer: Markus Koch <markus@notsyncing.net>
pkgname=python-pyuvm
pkgver=2.9.1
pkgrel=1
pkgdesc="pyuvm is the Universal Verification Methodology implemented in Python instead of SystemVerilog. pyuvm uses cocotb to interact with the simulator and schedule simulation events."
arch=('any')
url="https://github.com/pyuvm/pyuvm"
license=('Apache')
depends=('python' 'python-setuptools' 'python-cocotb')
makedepends=('git')
optdepends=('iverilog: for simulating verilog designs'
            'ghdl: for simulating VHDL designs'
            'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=("git+https://github.com/pyuvm/pyuvm#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/pyuvm"
    python setup.py build
}

package() {
    cd "${srcdir}/pyuvm"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
