# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-finesse
_name=finesse
pkgver=3.0
pkgrel=1
pkgdesc="Python based frequency domain interferometer simulation software"
license=("GPL3")
url="https://finesse.ifosim.org/"
depends=('suitesparse' 'python-pyspellchecker' 'python-deprecated' 'python-quantiphy')
optdepends=('gnuplot: for test_plot.kat example')
source=("git+https://gitlab.com/ifosim/${_name}/${_name}3.git#branch=master")
sha256sums=('SKIP')
arch=('any')

build() {
	cd $srcdir/${_name}3
	python setup.py build
}

package() {
	cd $srcdir/${_name}3
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
