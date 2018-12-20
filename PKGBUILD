# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Ryan Lovelett <ryan@lovelett.me>

pkgname=dvblast
pkgver=3.4
pkgrel=1
pkgdesc="A simple and powerful MPEG-2/TS demux and streaming application"
arch=('i686' 'x86_64')
url="https://www.videolan.org/projects/dvblast.html"
license=('GPL2')
depends=('glibc' 'libev')
makedepends=('bitstream')
source=("https://get.videolan.org/dvblast/$pkgver/dvblast-$pkgver.tar.bz2")
sha256sums=('7abd45aff738544017350af87ec7ebad00fcfb4e4effd04f35023d504d9b6f44')


build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
