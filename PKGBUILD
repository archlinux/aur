# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=citebib
_pkgname=CiteBib
pkgver=0.4.1
pkgrel=2
pkgdesc="Generate a nice Bibtex or Latex bibliography according to the document content"
arch=('any')
url="https://github.com/sciunto/CiteBib"
license=('GPL3')
depends=('python' 'python-bibtexparser')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(http://source.sciunto.org/citebib/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd "${srcdir}"
  python3 setup.py build
}

check() {
  cd "${srcdir}"
  nosetests3
}

package() {
  cd "${srcdir}"
  python3 setup.py install --root="${pkgdir}"
}

# vim:ts=2:sw=2:et:
md5sums=('cd061cd2aaebe2a5f8ecb992d4d99907')
