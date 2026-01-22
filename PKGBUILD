# Maintainer: 0e4ef622 <0e4ef622 at gmail.com>
pkgname=python-gnuplotlib
_name=${pkgname#python-}
pkgver=0.46
pkgrel=1
pkgdesc="gnuplot for numpy"
arch=('any')
url="https://github.com/dkogan/gnuplotlib"
license=('LGPL-3.0-or-later')
depends=('python-numpy' 'python-numpysane' 'python')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e713b73a64eb1a26af45870ee2de84c217e24d5a9f47365c6116afc315da6af4')

build() {
	cd $srcdir/$_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$_name-$pkgver
        python -m installer --destdir="$pkgdir" dist/*.whl
}
