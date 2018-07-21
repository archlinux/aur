# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>

pkgname=doctrina
pkgver=0.1.6
pkgrel=1
pkgdesc='The library of Software Peronista'
arch=('x86_64')
license=('GPL3')
url='https://git.softwareperonista.com.ar/cdp/doctrina'
depends=('glib2' 'sqlite3')
makedepends=('meson' 'vala')
source=("https://git.softwareperonista.com.ar/cdp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('11c180ff683e183ba6779fde3e287711f47b5fa942080f3e34460a6721138151')

build() {
  cd ${pkgname}

  arch-meson . build

  ninja -C build
}

package() {
  cd ${pkgname}

  DESTDIR="$pkgdir" ninja -C build install
}
