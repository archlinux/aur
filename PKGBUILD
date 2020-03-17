# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-edalize
pkgver=0.2
pkgrel=0
pkgdesc="Python Library for interacting with EDA tools."
arch=('any')
url="http://github.com/olofk/edalize/"
license=('BSD')
conflicts=('python-edalize')
provides=('python-edalize')
depends=('python' 'python-pytest')

makedepends=('python-setuptools')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs')

options=(!emptydirs)
source=("https://github.com/olofk/edalize/archive/v$pkgver.$pkgrel.tar.gz")
md5sums=('e2edd17257d4660c45711bd1b1756701')

package() {
    cd "${srcdir}/edalize-$pkgver.$pkgrel"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
