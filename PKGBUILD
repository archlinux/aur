# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-edalize
pkgver=0.1
pkgrel=7
pkgdesc="Python Library for interacting with EDA tools."
arch=('any')
url="http://github.com/olofk/edalize/"
license=('BSD')
conflicts=('python-edalize-git')
provides=('python-edalize')
depends=('python' 'python-pytest')

makedepends=('python-setuptools')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs')

options=(!emptydirs)
source=("https://github.com/olofk/edalize/archive/v$pkgver.$pkgrel.tar.gz")
md5sums=('46ebc35971187ace236418edff6455b7')

package() {
    cd "${srcdir}/edalize-$pkgver.$pkgrel"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
