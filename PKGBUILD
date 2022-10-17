# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=Disks
pkgname=desq-utils-disks
pkgver=0.0.7
pkgrel=1
pkgdesc="Disks Auto Mounter for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesqui' 'dfl-settings' 'dfl-utils' 'dfl-applications' 'dfl-xdg' 'dfl-storage')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('eb39740d3e290226cddadecd9fc92403')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
