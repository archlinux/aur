# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=doctrina
pkgver=0.1.10
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=('gtk3')
makedepends=('meson' 'vala')
source=("https://git.softwareperonista.com.ar/cdp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8ed73e6e543792b9efd1524d98199adf32792fbfb26fcfe5657f1e8b78e8a80c')

build() {
  cd ${pkgname}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" ninja -C build install
}
