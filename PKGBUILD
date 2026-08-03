# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>
# Contributor: Cleber Matheus <clebermatheus@outlook.com>

# shellcheck disable=SC2034
_py='python'
_pkg="blivet"
pkgname="python-${_pkg}"
pkgver=3.14.1
_tag="${_pkg}-${pkgver}"
pkgrel=1
_pkgdesc=('A DBus service and python module'
  'for management of the system storage configuration'
)
pkgdesc="${_pkgdesc[*]}"
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'arm'
  'aarch64'
)
license=(
  'LGPL2.1'
)
depends=(
  'libblockdev'
  'libselinux'
  'lsof'
  'multipath-tools'
  'parted'
  "${_py}"
  "${_py}-six"
  "${_py}-pyparted"
  "${_py}-pyudev"
  "${_py}-gobject"
  'systemd-libs'
  'util-linux'
)
checkdepends=(
  'libselinux'
  "${_py}-mock"
  "${_py}-dbus"
)
makedepends=(
  "${_py}-setuptools"
)
url='https://fedoraproject.org/wiki/Blivet'
_url="https://github.com/storaged-project/${_pkg}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${_url}/archive/${_pkg}-${pkgver}.tar.gz")
sha512sums=('b9e00ba98e8e999c8cadc9397def5b94a16e2264848baa404605c3c2dc7cc6e99fb362b9ccd0617c2470bf56f149776546e4c34b81219e34aade316f0514e3f8')

# shellcheck disable=SC2154
package() {
  cd \
    "${srcdir}/${_pkg}-${_tag}" || \
    exit
  "${_py}" \
    setup.py \
      install \
        --root="${pkgdir}" \
	--optimize=1
}

# vim:set sw=2 sts=-1 et:
