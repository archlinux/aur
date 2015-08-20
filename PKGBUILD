# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=bitlbee-steam-git
pkgver=323.439d777
pkgrel=1
pkgdesc="Steam protocol plugin for BitlBee"
arch=('i686' 'x86_64')
url="https://github.com/jgeboski/bitlbee-steam"
license=('GPL')
depends=('bitlbee' 'libgcrypt')
makedepends=('git')
source=("git+https://github.com/jgeboski/bitlbee-steam")
sha256sums=('SKIP')

pkgver() {
  cd "bitlbee-steam"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "bitlbee-steam"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  make -C "bitlbee-steam" DESTDIR="$pkgdir" install
}
