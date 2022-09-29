# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="blivet"
pkgname="python-${_pkg}"
pkgver=3.6.0
_tag="${_pkg}-${pkgver}"
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/storaged-project/${_pkg}/archive/${_pkg}-${pkgver}.tar.gz")
sha512sums=('6fada13e8a41f0c2ceccb7dc6a95a58d417cf31b24222d7cfb9987d0984984ca0873a0220e3eb66efaa0e56b5ea59df09875dfebb024c310698d49e844f497a5')

# shellcheck disable=SC2154
package() {
  cd "${srcdir}/${_pkg}-${_tag}" || exit
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
