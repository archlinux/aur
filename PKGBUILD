# Maintainer: Francisco Salces Carcoba <pacosalces@gmail.com>
pkgname=python-finesse
_name=finesse
pkgver=3.0a33
pkgrel=1
pkgdesc="Python based frequency domain interferometer simulation software"
license=("GPL3")
url='https://finesse.ifosim.org/'
depends=('suitesparse' 'python-pyspellchecker' 'python-deprecated' 'python-quantiphy')
optdepends=('gnuplot: for test_plot.kat example')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f0aa3755a2e72ff3f2a424e4cf3a5c15fb4164a2aff3ce9dbdd90d8787ab89fd')
arch=('any')

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
