# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=python-bitstruct
_pkgname=bitstruct
pkgver=8.11.0
pkgrel=1
pkgdesc="This module performs conversions between Python values and C bit field structs represented as Python byte strings"
arch=('any')
url="https://github.com/eerimoq/bitstruct"
license=('custom')
makedepends=('python-setuptools')
depends=('python')
source=(https://files.pythonhosted.org/packages/75/06/da9caba65a62a865df000ccb7c18508c3f4282658f48e72dd265867f9026/${_pkgname}-${pkgver}.tar.gz)
md5sums=('8eaf853c95e10ca4b6bca2fe5ff307c6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
