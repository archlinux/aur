# Maintainer: Peter Züger <zueger.peter@icloud.com>

pkgname=python-bitstruct
_pkgname=bitstruct
pkgver=8.14.1
pkgrel=1
pkgdesc="This module performs conversions between Python values and C bit field structs represented as Python byte strings"
arch=('any')
url="https://github.com/eerimoq/bitstruct"
license=('custom')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/70/0b/6f3f7161601ea761dac78ee5f429a0d7d69dcd2a34dcc15da8c124d7c35b/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3e319af37eed89c471685ff0cb2dfbce')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
