# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=utils
pkgname=dfl-utils
pkgver=0.1.0
pkgrel=1
pkgdesc="Some utilities for DFL"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('da9052d418350e374cede5c628f83103')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
