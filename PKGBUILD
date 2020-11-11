# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Christopher A. Williamson <home@chrisaw.com>

pkgname='python-dbus-signature-pyparsing'
_srcname='dbus-signature-pyparsing'
pkgver=0.03
pkgrel=8
pkgdesc='A Parser for a D-Bus Signature'
arch=('any')
license=('Apache')
url='https://github.com/stratis-storage/dbus-signature-pyparsing/releases'
depends=('python-pyparsing')
makedepends=('python-setuptools' 'git')
checkdepends=('python-nose' 'python-hypothesis' 'python-hs-dbus-signature')
source=(
  "${_srcname}-${pkgver}.tar.gz::https://github.com/stratis-storage/${_srcname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  '263a41161304f239213c0e1234f4afdbe28b7103e60129f0448ae14fb0e9c52b'
)

check() {
  cd "${_srcname}-${pkgver}"
  nosetests
}

package() {
  cd "${_srcname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
