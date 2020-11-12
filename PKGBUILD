# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Christopher A. Williamson <home@chrisaw.com>

pkgname='python-dbus-client-gen'
_srcname='dbus-python-client-gen'
pkgver=0.7
pkgrel=5
pkgdesc='A Python Library for Generating dbus-python Client Code'
arch=('any')
license=('MPL2')
url='https://stratis-storage.github.io/'
depends=('python-dbus' 'dbus-client-gen' 'python-into-dbus')
makedepends=('git' 'python-pylint')
checkdepends=('python-nose')
source=(
  "${_srcname}-${pkgver}.tar.gz::https://github.com/stratis-storage/${_srcname}/archive/v${pkgver}.tar.gz"
)
sha256sums=('9db0aa6692f5bb1496b5bd436aae1aa2b3f24cad0fb76ceceb5fae6df1594219')

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
