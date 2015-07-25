# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-meshpy
_pkgname=MeshPy
pkgver=2014.1
pkgrel=1
pkgdesc="Bibtex parser in python2"
arch=('any')
url="https://meshpy.readthedocs.org/"
license=('LGPL3')
depends=('python2' 'python2-pyvtk')
makedepends=('python2-setuptools')
#checkdepends=('python2-nose')
source=(https://pypi.python.org/packages/source/M/MeshPy/MeshPy-$pkgver.tar.gz)
sha256sums=('a090729c9b99360b2741099906361b2e9ba6373b97707817c9b81f66531380b6')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 configure.py
  python2 setup.py build
}

#check() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  nosetests2
#}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
