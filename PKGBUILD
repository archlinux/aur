# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=tty-copy
pkgver=0.2.2
pkgrel=1
pkgdesc="Copy content to system clipboard via TTY and terminal using ANSI OSC52 sequence"
arch=(any)
url="https://github.com/jirutka/tty-copy"
license=(MIT)
makedepends=(asciidoctor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirutka/tty-copy/archive/v$pkgver.tar.gz")
sha256sums=('5dad7c9eeb1f13747f989e38c4165edd367e7c6c348545b28ac8c1fb50cf4716')

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
