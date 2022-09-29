# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=python-blivet
pkgver=3.4.3
_tag="blivet-${pkgver}"
pkgrel=5
pkgdesc='A DBus service and python module for management of the system storage configuration'
arch=('x86_64'
      'i686'
      'pentium4')
license=('LGPL2.1')
depends=('python'
         'python-six'
         'python-pyparted'
         'python-pyudev'
         'python-gobject'
         'libselinux'
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
sha512sums=('e0470dd524895163d6be4c68b143a9662fc54c506f6ddedf04804805faf305b885d3f73fccaf9ee172e41279efb461b17baaa0941b5dc91bcfadfd3517ef8d30')

package() {
  cd "${srcdir}/blivet-${_tag}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
