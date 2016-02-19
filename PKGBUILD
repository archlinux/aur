# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-dask
_pkgname=dask
pkgver=0.8.0
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://dask.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'python-dill' 'python-pandas' 'python-toolz' 'python-psutil' 'python-pyzmq' 'python-bcolz' 'python-cloudpickle' 'python-partd')
makedepends=('python-setuptools')
checkdepends=('python-pytest') # 'python-pygraphviz' 'python-cachey'
source=(https://pypi.python.org/packages/source/d/dask/dask-$pkgver.tar.gz)
sha256sums=('3cc8ac74589b13c959c9f72bfc4092aed549da08987c0ba087a64abb5d129796')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  py.test
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
