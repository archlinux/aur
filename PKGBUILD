# Maintainer: Sergey Salnikov <salsergey at gmail dot com>

pkgname=citebib
_pkgname=CiteBib
pkgver=0.4.5
pkgrel=1
pkgdesc="Generate a nice Bibtex or Latex bibliography according to the document content"
arch=('any')
url="https://github.com/salsergey/CiteBib"
license=('GPL3')
depends=('python' 'python-bibtexparser')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/salsergey/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('d831b874da3de4a6cbf02a68bd04b0b42f5e120f2740c8f9b0f8d8c397d0fc36')

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
