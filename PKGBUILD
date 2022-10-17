# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## dfl-wayqt -> dfl-clipboard

_pkgname=clipboard
pkgname=dfl-clipboard
pkgver=0.1.0
pkgrel=1
pkgdesc="Clipboard Manager based on wlroots data control protocol"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/desktop-frameworks/$_pkgname"
license=('GPL3')
depends=('qt5-base' 'dfl-wayqt')
makedepends=('meson' 'ninja')
source=("$url/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('963be52dd142a58dd8757bd44333d13e')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
