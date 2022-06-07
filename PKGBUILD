# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=python-bitstruct
_pkgname=bitstruct
pkgver=8.15.1
pkgrel=1
pkgdesc="This module performs conversions between Python values and C bit field structs represented as Python byte strings"
arch=('any')
url="https://github.com/eerimoq/bitstruct"
license=('custom')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/96/19/7c9f846cec3f2c251b5b35d2417b91ffbf0a22a3344f5eb084cf4c1725b4/${_pkgname}-${pkgver}.tar.gz")
md5sums=('79b8e882a14904e2cec6341ff1115001')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
