# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=color-utils
pkgname=dfl-color-utils
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple pure Qt/C++ implementation of the cylindrical color space model characterized by Hue-Chroma-Luma"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('42cfd13cda999c865a702b96d41867ce')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
