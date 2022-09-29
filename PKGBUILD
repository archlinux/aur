# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Julian Mac Kenzie <jukiangm@gmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=blivet-gui
pkgver=2.4.0
_pkgver="${pkgver}-1"
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
depends=('python' 'python-blivet' 'python-cairo' 'python-gobject' 'python-pid' 'adwaita-icon-theme')
makedepends=('git' 'make')
_commit="5aa45cffd1f9650f36a6b82f5bc50ccddc8a8c88"
source=("${pkgname}::git+${url}#commit=${_commit}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" RPM_BUILD_ROOT="${pkgdir}" install
}
