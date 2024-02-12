# Maintainer: 0e4ef622 <0e4ef622 at gmail.com>
pkgname=python-gnuplotlib
_name=${pkgname#python-}
pkgver=0.41
pkgrel=1
pkgdesc="gnuplot for numpy"
arch=('any')
url="https://github.com/dkogan/gnuplotlib"
license=('LGPL-3.0-or-later')
depends=('python-numpy' 'python-numpysane' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4b378dc59c2b334c56613b84b173122aef5c35841e6e46413d6df5ef4e32937c')

build() {
	cd $srcdir/$_name-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/$_name-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
