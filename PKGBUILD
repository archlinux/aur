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
pkgver=3.13.0
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
sha512sums=('fc3336512b4f8b2ca49462a805ccb809f9139427e98ada64be8f0f144c640c4e691bfaae97d81e9fc0defbd6e8314178f33c58a3e462307e20da6426d4236e2f')

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
