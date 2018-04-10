# Maintainer: Emil Lundberg <emil@emlun.se>

pkgname="python-fido2"
pkgver="0.2.1"
pkgrel="2"
pkgdesc="Library for FIDO 2.0, including communication with a device over USB"
url="https://github.com/Yubico/python-fido2"
license=('custom:BSD-2-clause')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=(
  "https://github.com/Yubico/${pkgname}/archive/${pkgver}.tar.gz"
)
sha256sums=('32497f371b13ef13b68f4b7cd1a188d966c0e6918ff0c586dbbceb4629a35ac9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1

  install -D -m0644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 sts=2 et
