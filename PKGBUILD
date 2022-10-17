# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=Volume
pkgname=desq-utils-volume
pkgver=0.0.7
pkgrel=1
pkgdesc="Volume control for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQUtils/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'libcanberra' 'libpulse' 'libdesqui' 'dfl-settings' 'dfl-utils' 'dfl-applications')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQUtils/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('4f3b8ff836e01e0744e48f4a39e63b54')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
