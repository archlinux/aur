# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=python-bitstruct
_pkgname=bitstruct
pkgver=8.11.1
pkgrel=1
pkgdesc="This module performs conversions between Python values and C bit field structs represented as Python byte strings"
arch=('any')
url="https://github.com/eerimoq/bitstruct"
license=('custom')
makedepends=('python-setuptools')
depends=('python')
source=(https://files.pythonhosted.org/packages/95/33/9f094b5e32bc0927acf282199d35c384092dd73505c88fadb69292106eaf/${_pkgname}-${pkgver}.tar.gz)
md5sums=('9b2503b831532ea26381f5a0e2b41253')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
