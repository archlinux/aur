# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-dask
_pkgname=dask
pkgver=0.8.1
pkgrel=2
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://dask.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-dill' 'python-pandas' 'python-toolz' 'python-psutil' 'python-pyzmq' 'python-bcolz' 'python-cloudpickle' 'python-partd' )
makedepends=('python-setuptools')
checkdepends=('python-pytest') # 'python-pygraphviz' 'python-cachey'
source=(https://pypi.python.org/packages/source/d/dask/dask-$pkgver.tar.gz)
sha256sums=('43deb1934cd033668e5e60b735f45c9c3ee2813f87bd51c243f975e55267fa43')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  py.test
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
