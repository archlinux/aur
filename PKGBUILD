# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=volume
pkgname=dfl-volume
pkgver=0.1.0
pkgrel=1
pkgdesc="Volume control to allow users to choose devices and control the volume"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'libpulse')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('2f47fde07660b9af1e0fcefa84919c83')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
