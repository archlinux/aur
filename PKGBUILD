# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=citebib
_pkgname=CiteBib
pkgver=0.4.1
pkgrel=3
pkgdesc="Generate a nice Bibtex or Latex bibliography according to the document content"
arch=('any')
url="https://github.com/sciunto/CiteBib"
license=('GPL3')
depends=('python' 'python-bibtexparser')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://pypi.python.org/packages/source/C/CiteBib/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('987a7ce0927eb2ccd4d67d7ba1a4811f3012515f506894dab25f83caa2ecea06')

build() {
  cd "${srcdir}"
  python setup.py build
}

check() {
  cd "${srcdir}"
  nosetests3
}

package() {
  cd "${srcdir}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
