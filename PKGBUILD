# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=citebib
_pkgname=CiteBib
pkgver=0.4.2
pkgrel=2
pkgdesc="Generate a nice Bibtex or Latex bibliography according to the document content"
arch=('any')
url="https://github.com/sciunto/CiteBib"
license=('GPL3')
depends=('python' 'python-bibtexparser')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://pypi.python.org/packages/source/C/CiteBib/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('f7d7da7af42ab6341670da925c63f2970193843c6fea261f8e3b2c5f521d99c5')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  nosetests3
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
