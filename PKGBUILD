# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=python-blivet
pkgver=3.3.3
_tag="blivet-${pkgver}"
pkgrel=4
pkgdesc='A DBus service and python module for management of the system storage configuration'
arch=('any')
license=('LGPL2.1')
depends=('python'
         'python-six'
         'python-pyparted'
         'python-pyudev'
         'python-gobject'
         'libblockdev'
         'parted'
         'lsof'
         'multipath-tools'
         'util-linux'
         'systemd-libs'
)
checkdepends=('libselinux' 'python-mock' 'python-dbus')
makedepends=('python-setuptools' 'make')
url='https://fedoraproject.org/wiki/Blivet'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/storaged-project/blivet/archive/blivet-${pkgver}.tar.gz")
sha512sums=('b80e4197d554d987efebd523347a37401299429f4bcc50d0b0c80aab709453df196122f0adffb7477bd20b4990c0d91b3162a96c956a8c4222d1c01de1e17a53')

package() {
  cd "${srcdir}/blivet-${_tag}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
