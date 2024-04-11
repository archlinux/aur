# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Christopher A. Williamson <home@chrisaw.com>

pkgname='python-dbus-client-gen'
_srcname='dbus-python-client-gen'
pkgver=0.8.3
pkgrel=2
pkgdesc='A Python Library for Generating dbus-python Client Code'
arch=('any')
license=('MPL2')
url='https://stratis-storage.github.io/'
depends=('dbus-python' 'dbus-client-gen' 'python-into-dbus')
makedepends=('git' 'python-pylint' 'python-setuptools')
checkdepends=('python-nose')
source=(
  "${_srcname}-${pkgver}.tar.gz::https://github.com/stratis-storage/${_srcname}/archive/v${pkgver}.tar.gz"
)
sha256sums=('d9e93ad8d7011e843123248f127dbe7b394bf5d3c4e7367cf05bed112df8b384')

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
