# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-bibtexparser
pkgver=0.6.0
pkgrel=1
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LGPL3')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=(http://source.sciunto.org/bibtexparser/bibtexparser-$pkgver.tar.bz2)

build() {
  cd "$srcdir/bibtexparser"
  python2 setup.py build
}

check() {
  cd "$srcdir/bibtexparser"
  nosetests2
}

package(){
  cd "$srcdir/bibtexparser"
  python2 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('2141c782baa9881db30ae93039075737')
