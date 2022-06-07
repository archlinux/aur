# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=python-bitstruct
_pkgname=bitstruct
pkgver=8.15.0
pkgrel=1
pkgdesc="This module performs conversions between Python values and C bit field structs represented as Python byte strings"
arch=('any')
url="https://github.com/eerimoq/bitstruct"
license=('custom')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/4d/72/066c87ff129881fbf2d041332e2bfd3b275d3fa9cc7088ae2afb670ee045/${_pkgname}-${pkgver}.tar.gz")
md5sums=('f9946c6e07067283c0e014841ae51180')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
