# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-ipc ->

_pkgname=ipc
pkgname=dfl-ipc
pkgver=0.1.0alpha1
pkgrel=1
pkgdesc="A very simple set of IPC classes for inter-process communication"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver/alpha1/-alpha1}/${_pkgname}-v${pkgver/alpha1/-alpha1}.tar.gz")
md5sums=('d482d0c66738c4143ef72691441b8758')

build() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver/alpha1/-alpha1}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
