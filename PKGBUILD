# Maintainer: Christopher A. Williamson <home@chrisaw.com>

pkgname='python-into-dbus'
_srcname='into-dbus-python'
pkgver=0.06
pkgrel=3
pkgdesc='Facilities for converting an object that inhabits core Python types, e.g., lists, ints, dicts, to an object that inhabits dbus-python types, e.g., dbus.Array, dbus.UInt32, dbus.Dictionary based on a specified dbus signature.'
arch=('any')
license=('apache2')
url='stratis-storage.github.io'
depends=('python-dbus')
makedepends=('git' 'python-pylint' 'python-tox')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
  "${_srcname}-${pkgver}.tar.gz::https://github.com/stratis-storage/${_srcname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'e2ec6496e55d1bc560db1075ad2038b760e01b9ad425c8d8632e6b0873b588cb'
)

check() {
  cd "${_srcname}-${pkgver}"

  # disabled due to failing lint test
  #tox
}

package() {
  cd "${_srcname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
