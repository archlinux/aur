# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=doctrina
pkgver=0.1.11
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=('gtk3')
makedepends=('meson' 'vala')
source=("https://git.softwareperonista.com.ar/cdp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('72aae601adafb64ddca595d2b7ee746d11b277cb3fdec31ef374a0570bf857ad')

build() {
  cd ${pkgname}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" ninja -C build install
}
