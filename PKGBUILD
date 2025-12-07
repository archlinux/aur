# Maintainer: voxa, <admin at hessfr dot fr>
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
pkgver=2.6.0
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=(
  'x86_64'
  'pentium4'
  'i686'
  'arm')
license=('GPL')
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
  "${_py}-setuptools")
source=(
  "${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=(
  'e1ea4579aa10b44ac2ab79afff61fa5dc952661fabca893aac26766893ccd81a54118ad9744d76fa95480e2a25d1627f425548fe6086baae50aabfe1ba278d7c')

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
