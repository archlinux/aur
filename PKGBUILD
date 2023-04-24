# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: Christopher A. Williamson <home@chrisaw.com>

pkgname='python-dbus-client-gen'
_srcname='dbus-python-client-gen'
pkgver=0.8
pkgrel=4
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
sha256sums=('11ade54ee6b12e69369722e9327c26668e3ae2b033a16c31a02d72a75d8a4623')

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
