# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bibtexparser
_pkgname=bibtexparser
pkgver=1.0.1
pkgrel=1
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://pypi.python.org/packages/35/71/209bae42db6cc230ffd126dbda7ec057dd69a084acb4ddcd9ab4544c4506/bibtexparser-1.0.1.tar.gz)
sha256sums=('cc41cdd8332c2bf44b97daf1f135f4f267c3b744c33976655cd270b66f964c0a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  nosetests3
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
