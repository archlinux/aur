# Maintainer: Sergey Salnikov <salsergey at gmail dot com>

pkgname=citebib
_pkgname=CiteBib
pkgver=0.4.4
pkgrel=1
pkgdesc="Generate a nice Bibtex or Latex bibliography according to the document content"
arch=('any')
url="https://github.com/salsergey/CiteBib"
license=('GPL3')
depends=('python' 'python-bibtexparser')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/salsergey/CiteBib/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('99e4f2afde109c2c220d4b97d8ac516879a900d4fbb9b68454934dcbe0fae61f')

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
