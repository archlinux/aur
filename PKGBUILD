# Maintainer: Jakub Jirutka <jakub@jirutka.cz>

pkgname=tty-copy
pkgver=0.2.0
pkgrel=1
pkgdesc="Copy content to system clipboard via TTY and terminal using ANSI OSC52 sequence"
arch=(any)
url="https://github.com/jirutka/tty-copy"
license=(MIT)
makedepends=(asciidoctor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirutka/tty-copy/archive/v$pkgver.tar.gz")
sha256sums=('ff3326f1bbc4633a528009156d91a93fd7b649143894eb4e6afe09cdd06b8f90')

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
