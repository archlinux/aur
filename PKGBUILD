# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=doctrina
pkgver=0.1.13.2
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=('gtk4')
makedepends=('meson' 'vala')
source=("https://gitlab.com/softwareperonista/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d9863cf3a3eddbd5738509b434a949ae2a6e66de9b6687505d62cd767fe27955')

build() {
  cd ${pkgname}-${pkgver}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}

  DESTDIR="$pkgdir" ninja -C build install
}
