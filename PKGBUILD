# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-finesse
_name=finesse
pkgver=3.0a21
pkgrel=1
pkgdesc="Python based frequency domain interferometer simulation software"
license=("GPL3")
url='https://finesse.ifosim.org/'
depends=('suitesparse' 'python-pyspellchecker' 'python-deprecated' 'python-quantiphy')
optdepends=('gnuplot: for test_plot.kat example')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8dae28db4565ab8554dfd473c6d291625956de2a2d1615b4783b79f9ecd5bd0d')
arch=('any')

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
