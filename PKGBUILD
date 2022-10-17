# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=xdg
pkgname=dfl-xdg
pkgver=0.1.0
pkgrel=1
pkgdesc="XDG Specifications implementation for Qt"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('6459a1807ca335d12b0b13c5c785795f')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
