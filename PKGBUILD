# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=bitlbee-steam-git
pkgver=v1.4.2.r5.g49d46c8
pkgrel=1
pkgdesc="Steam protocol plugin for BitlBee"
arch=('i686' 'x86_64')
url="https://github.com/bitlbee/bitlbee-steam"
license=('GPLv2')
depends=('bitlbee' 'libgcrypt')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "bitlbee-steam"
    git describe --long --tags | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bitlbee-steam"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  make -C "bitlbee-steam" DESTDIR="$pkgdir" install
}
