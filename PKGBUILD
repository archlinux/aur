# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="blivet"
pkgname="python-${_pkg}"
pkgver=3.7.1
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
sha512sums=('12580e5c718c109613d5c9ab2474c23820417abb421e59433f77d187169a4ce3f495a8e36fcb01290c86e461b51f1b829c5a84601e9f7e75b253aa961bb02619')

# shellcheck disable=SC2154
package() {
  cd "${srcdir}/${_pkg}-${_tag}" || exit
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
