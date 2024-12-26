# Maintainer: 0e4ef622 <0e4ef622 at gmail.com>
pkgname=python-gnuplotlib
_name=${pkgname#python-}
pkgver=0.42
pkgrel=1
pkgdesc="gnuplot for numpy"
arch=('any')
url="https://github.com/dkogan/gnuplotlib"
license=('LGPL-3.0-or-later')
depends=('python-numpy' 'python-numpysane' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('00287a71b8ef5087baa16b86cf4aed77e55461f04d4dfad5d17ab4a6383fb9ba')

build() {
	cd $srcdir/$_name-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/$_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
