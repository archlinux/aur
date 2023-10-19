# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=python-bitstruct
_pkgname=bitstruct
pkgver=8.18.0
pkgrel=1
pkgdesc="This module performs conversions between Python values and C bit field structs represented as Python byte strings"
arch=('any')
url="https://github.com/eerimoq/bitstruct"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/ac/1a/f51ba0abf687433681b5607cab8307a822c56c6e43a2913c3d8f1531df7e/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('91865b210a4bfa86817537c0d934fac97fe671717f08665dc134551cfed3be13')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
