# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=Disks
pkgname=desq-utils-disks
pkgver=0.0.8
pkgrel=1
pkgdesc="Disks Auto Mounter for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesqui' 'dfl-settings' 'dfl-utils' 'dfl-applications' 'dfl-xdg' 'dfl-storage')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('304df6c59bd2d2b6ab32ce5b0dbcc59a')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
