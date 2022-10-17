# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-color-utils -> dfl-config-parser

_pkgname=config-parser
pkgname=dfl-config-parser
pkgver=0.1.0
pkgrel=1
pkgdesc="A Collection of Config Parsers for DFL. Currently it contains a config parser for KDE Color Schemes"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'dfl-color-utils')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('3acba823ad55b8284526d9f7d8696de8')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
