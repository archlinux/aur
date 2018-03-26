# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=pace
pkgver=0.4.1
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://github.com/softwareperonista/pace'
depends=('gtksourceview3')
makedepends=('meson' 'vala')
source=("https://softwareperonista.com.ar/releases/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1fd8787f6e6c10ffb641685253f06c4b50b557cfce966a58330749f5be773dd7')

build() {
  cd ${pkgname}-${pkgver}

  arch-meson . build

  ninja -C build
}

check () {
  cd ${pkgname}-${pkgver}

  ninja -C build test
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install
}
