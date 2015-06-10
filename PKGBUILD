# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bibtexparser
pkgver=0.6.0
pkgrel=1
pkgdesc="Bibtex parser in Python"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(http://source.sciunto.org/bibtexparser/bibtexparser-$pkgver.tar.bz2)

build() {
  cd "$srcdir/bibtexparser"
  python setup.py build
}

check() {
  cd "$srcdir/bibtexparser"
  nosetests3
}


package(){
  cd "$srcdir/bibtexparser"
  python setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('2141c782baa9881db30ae93039075737')
