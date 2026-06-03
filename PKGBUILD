# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: rennero <rennero@bastardi.net>

pkgname=hasciicam
pkgver=2.4.0
pkgrel=1
pkgdesc="Renders video input as ascii (to the terminal, textfile, or live webpage)"
url="http://dyne.org/hasciicam/"
depends=('sdl2' 'ncurses')
makedepends=('cmake' 'ninja')
arch=('i686' 'x86_64')
source=("https://github.com/dyne/${pkgname}/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('94c59f127a10c4c3d0009d10eff65d21')
license=('GPL-2.0-or-later')

build() {
  cmake -B build -S "${pkgname}-$pkgver" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
