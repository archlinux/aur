# Maintainer: rains31@gmail.com

pkgname=python-gattlib
pkgver=0.20201113
pkgrel=1
pkgdesc='This is a Python library to use the GATT Protocol for Bluetooth LE devices. It is a wrapper around the implementation used by gatttool in bluez package. It does not call other binaries to do its job :)'
arch=(any)
url="https://github.com/OscarAcena/pygattlib"
license=('Apache')
depends=('python' 'boost' 'bluez-libs' 'glib2')
makedepends=('python-setuptools')
source=(
    "https://files.pythonhosted.org/packages/fe/8d/72d539dd6be2d9677864a1604b8db80696c2d5f018cf8093bf442311162f/gattlib-0.20201113.tar.gz"
)
md5sums=(
    "433581aba2b9d3b621094fb62d20dfd5"
)


build() {
  cd "${srcdir}/gattlib-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/gattlib-${pkgver}"
  python3 setup.py install --root "$pkgdir"
  chmod +rx -R "$pkgdir"
}
