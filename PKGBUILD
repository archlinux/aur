# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Julian Mac Kenzie <jukiangm@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

# shellcheck disable=SC2034
_pkg="blivet"
pkgname="${_pkg}-gui"
pkgver=2.4.0
_pkgver="${pkgver}-1"
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('x86_64'
      'pentium4'
      'i686')
license=('GPL')
url="https://github.com/storaged-project/${_pkg}-gui"
depends=('python'
         "python-${_pkg}"
         'python-cairo'
         'python-gobject'
         'python-pid'
         'adwaita-icon-theme')
makedepends=('git' 'make')
source=("${pkgname}::git+${url}.git#tag=${_pkgver}")
b2sums=('SKIP')

build() {
  cd "${pkgname}" || exit
  make
}

# shellcheck disable=SC2154
package() {
  cd "${pkgname}" || exit
  make DESTDIR="${pkgdir}" RPM_BUILD_ROOT="${pkgdir}" install
}
