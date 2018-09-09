# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=doctrina
pkgver=0.1.7
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=('glib2' 'sqlite3')
makedepends=('meson' 'vala')
source=("https://git.softwareperonista.com.ar/cdp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6d2e43ee0f307566b4688e631f9ce8efc6ebc2c8ea5db86dd08af3a133364cea')

build() {
  cd ${pkgname}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" ninja -C build install
}
