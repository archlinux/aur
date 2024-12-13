# Maintainer: Sergey Salnikov <salsergey at gmail dot com>

pkgname=citebib
_pkgname=CiteBib
pkgver=0.4.6
pkgrel=1
pkgdesc="Generate a nice Bibtex or Latex bibliography according to the document content"
arch=('any')
url="https://github.com/salsergey/CiteBib"
license=('GPL3')
depends=('python' 'python-bibtexparser')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/salsergey/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('e7a3e1dff586595457361c608847f163955e5d64e59d375d9ada9d41278d885a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  nosetests3
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
