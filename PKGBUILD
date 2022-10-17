# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=login1
pkgname=dfl-login1
pkgver=0.1.0
pkgrel=1
pkgdesc="Implementation of systemd/elogind for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('661dda222d759009c020f58511b53f3702fdbace5e79e957afd83c41ae3482ed')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
