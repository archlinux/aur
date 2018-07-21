# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=doctrina
pkgver=0.1.5
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=('glib2' 'sqlite3')
makedepends=('meson' 'vala')
source=("https://git.softwareperonista.com.ar/cdp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9c78a8f9904feb1ff552d2e0373edd6a43ed8a389c3a6096a417aad86f976da7')

build() {
  cd ${pkgname}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" ninja -C build install
}
