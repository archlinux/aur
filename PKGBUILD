# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=pace
pkgver=0.6.0
pkgrel=1
pkgdesc='A simple pacman.conf editor'
arch=('x86_64')
license=('GPL3')
url='https://github.com/softwareperonista/pace'
depends=('gtksourceview3')
makedepends=('meson' 'vala')
source=("https://github.com/softwareperonista/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3fc4466ee7273d5cbd84eecb224b84ccd7e322eb14940fee908ab6a332c85c84')

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
