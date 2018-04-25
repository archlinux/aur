# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=pace
pkgver=0.6.1
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://github.com/softwareperonista/pace'
depends=('gtksourceview3')
makedepends=('meson' 'vala')
source=("https://github.com/softwareperonista/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('25e8b0e2575ae1cb3347d36698715cf8bf11e824e62c384e10913fc87893411d')

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
