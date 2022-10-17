# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-ipc ->

_pkgname=ipc
pkgname=dfl-ipc
pkgver=0.1.0
pkgrel=1
pkgdesc="A very simple set of IPC classes for inter-process communication"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('d17858a47adb50c8f6d021a3a7c8aa70')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
