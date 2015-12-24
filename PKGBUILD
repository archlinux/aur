# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bibtexparser
_pkgname=bibtexparser
pkgver=0.6.2
pkgrel=1
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://pypi.python.org/packages/source/b/bibtexparser/bibtexparser-$pkgver.tar.gz)
sha256sums=('5888219ac5db1c63ae0ad4db52ec7ad87fe7a32bd60e62ee87bceedb8ebf73b8')

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
