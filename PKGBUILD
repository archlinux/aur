# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Pellegrino Prevete (dvorak) <pellegrinoprevete@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>

# shellcheck disable=SC2034
_py='python'
_pkg="blivet"
pkgname="python-${_pkg}"
pkgver=3.8.2
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
  'make'
)
url='https://fedoraproject.org/wiki/Blivet'
_url="https://github.com/storaged-project/${_pkg}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${_url}/archive/${_pkg}-${pkgver}.tar.gz")
sha512sums=(
  '0e29d774e855000fefcaa33c91cb08d6fbc64d8674da2cf4a842a72bec748b499e086a829a172777279d822f635fc547750da0c40090b4e7aed0a079c615e4e2'
)

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
