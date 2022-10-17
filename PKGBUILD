# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=wayqt
pkgname=dfl-wayqt
pkgver=0.1.0
pkgrel=1
pkgdesc="A Qt-based wrapper for various wayland protocols"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'wayland-protocols' 'wlroots')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('71f20e6196a32dd8aca7d4b408b4b3ea')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
