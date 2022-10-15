# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-ipc ->

_pkgname=ipc
pkgname=dfl-ipc
pkgver=0.1.0beta1
pkgrel=1
pkgdesc="A very simple set of IPC classes for inter-process communication"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/beta1/-beta1}/${_pkgname}-v${pkgver/beta1/-beta1}.tar.gz")
md5sums=('081ea49d9b9eeaadaa56e9d772611e65')

build() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/beta1/-beta1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
