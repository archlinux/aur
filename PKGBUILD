# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Julian Mac Kenzie <jukiangm@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

# shellcheck disable=SC2034
_pkg="blivet"
pkgname="${_pkg}-gui"
pkgver=2.4.1
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
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9594d3faebcd02d9142a180e25651411690faa71e53a4d961d14d8e7d6f7a7916d084ebbf7117d48c85274eea8c16fe99f09232ec526263ae72a0798aae591bf')

build() {
  cd "${pkgname}-${pkgver}" || exit
  make
}

# shellcheck disable=SC2154
package() {
  cd "${pkgname}-${pkgver}" || exit
  make DESTDIR="${pkgdir}" RPM_BUILD_ROOT="${pkgdir}" install
}
