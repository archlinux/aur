# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=pace
pkgver=0.4.2
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://github.com/softwareperonista/pace'
depends=('gtksourceview3')
makedepends=('meson' 'vala')
source=("https://softwareperonista.com.ar/releases/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6cc09276d2ac131b28ed30f4c58847facf80bc8d9308919a1b58c549c58ab340')

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
