# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=tty-copy
pkgver=0.2.1
pkgrel=1
pkgdesc="Copy content to system clipboard via TTY and terminal using ANSI OSC52 sequence"
arch=(any)
url="https://github.com/jirutka/tty-copy"
license=(MIT)
makedepends=(asciidoctor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirutka/tty-copy/archive/v$pkgver.tar.gz")
sha256sums=('88db18987ff8e8a045de5a759d541982a14f83dd2f8dc933f3d33536cf374fa2')

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  ./build/tty-copy -V
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
