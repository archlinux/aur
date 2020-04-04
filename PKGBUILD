# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=blivet-gui
_realver=2.1.13-1
_tag="${_realver}"
pkgver=${_realver/-/.}
pkgrel=1
pkgdesc='GUI tool for storage configuration'
arch=('any')
license=('GPL')
url='https://github.com/storaged-project/blivet-gui'
depends=('python' 'python-blivet' 'python-cairo' 'python-gobject' 'python-pid' 'adwaita-icon-theme')
makedepends=('make')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/storaged-project/blivet-gui/archive/${_tag}.tar.gz")
sha512sums=('608ea5932a08351e5920bb27828d1808995260114599fdd75811771521645da47458d1a64d8fa09c135de077c6917d41d603c42614c8f6cce0c863c40e48f90e')

build() {
  cd "${srcdir}/${pkgname}-${_tag}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_tag}"

  echo "${pkgdir}"
  make DESTDIR="${pkgdir}" RPM_BUILD_ROOT="${pkgdir}" install
}
