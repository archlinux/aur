# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Dvd-Znf <email@dvdznf.xyz>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Truocolo <truocolo@aol.com>
# Contributor: Julian Mac Kenzie <jukiangm@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Vladimir Panteleev (CyberShadow) <archlinux@cy.md>

# shellcheck disable=SC2034
_py="python"
pkgname="blivet-gui"
pkgver=2.4.1
pkgrel=3
pkgdesc='GUI tool for storage configuration'
arch=(
  'x86_64'
  'pentium4'
  'i686'
  'arm')
license=('GPL-2.0-or-later')
url="https://github.com/storaged-project/${pkgname}"
depends=(
  "${_py}"
  "${_py}-blivet"
  "${_py}-cairo"
  "${_py}-gobject"
  "${_py}-pid"
  'adwaita-icon-theme')
makedepends=(
  'git'
  'make'
  "${_py}-setuptools")
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('32c7c83b35d09d993b306e974cbb56b4334854ce3361eb660c09b66b4a51df95')

build() {
  cd \
    "${pkgname}-${pkgver}" || \
    exit
  make
}

# shellcheck disable=SC2154
package() {
  cd \
    "${pkgname}-${pkgver}" || \
    exit
  make \
    DESTDIR="${pkgdir}" \
    RPM_BUILD_ROOT="${pkgdir}" \
    install
}
