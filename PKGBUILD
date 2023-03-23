# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="blivet"
pkgname="python-${_pkg}"
pkgver=3.7.0
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
sha512sums=('3ddc62c4a9d517531d51a3fb761069f81f49fb4cc06b9a3b2391aec1607ff856c66766f37f49ab295ba8c66db8d8c02a1c80563c8ae91829b919392bced5cf48')

# shellcheck disable=SC2154
package() {
  cd "${srcdir}/${_pkg}-${_tag}" || exit
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
