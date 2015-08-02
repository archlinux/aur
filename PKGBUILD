# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-bibtexparser
_pkgname=bibtexparser
pkgver=0.6.1
pkgrel=1
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LGPL3')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=(https://pypi.python.org/packages/source/b/bibtexparser/bibtexparser-$pkgver.tar.gz)
sha256sums=('944249c1cfce9f2c69f0decc2d3fab54e8adb5d5cac5eda32cfba8898b602742')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  nosetests2
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
