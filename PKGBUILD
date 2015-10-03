# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bibtexparser
_pkgname=bibtexparser
pkgver=0.6.1
pkgrel=2
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://pypi.python.org/packages/source/b/bibtexparser/bibtexparser-$pkgver.tar.gz)
sha256sums=('944249c1cfce9f2c69f0decc2d3fab54e8adb5d5cac5eda32cfba8898b602742')

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
