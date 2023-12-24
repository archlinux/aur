# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Julian Mac Kenzie <jukiangm@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Vladimir Panteleev (CyberShadow) <archlinux@cy.md>

# shellcheck disable=SC2034
_py="python"
_pkg="blivet"
pkgname="${_pkg}-gui"
pkgver=2.4.1
_pkgver="${pkgver}-1"
pkgrel=2
pkgdesc='GUI tool for storage configuration'
arch=(
  'x86_64'
  'pentium4'
  'i686'
  'arm')
license=('GPL')
url="https://github.com/storaged-project/${_pkg}-gui"
depends=(
  "${_py}"
  "${_py}-${_pkg}"
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
sha512sums=(
  '9594d3faebcd02d9142a180e25651411690faa71e53a4d961d14d8e7d6f7a7916d084ebbf7117d48c85274eea8c16fe99f09232ec526263ae72a0798aae591bf')

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

# vim:set sw=2 sts=-1 et:
