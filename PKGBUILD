# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-edalize
pkgver=0.2
pkgrel=0
pkgdesc="Python Library for interacting with EDA tools."
arch=('any')
url="http://github.com/olofk/edalize/"
license=('BSD')
conflicts=('python-edalize-git')
provides=('python-edalize')
depends=('python' 'python-pytest')

makedepends=('git' 'python-setuptools')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=("git+https://github.com/olofk/edalize#tag=v${pkgver}.${pkgrel}")
md5sums=('SKIP')

package() {
    cd "${srcdir}/edalize"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
