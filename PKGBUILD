# Maintainer: Aram Jamal contact@aramjamal.com 

pkgname=2048-tui
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple terminal-based 2048 game written in C using ncurses."
arch=('x86_64')
url="https://github.com/aramyamal/2048-tui"
license=('GPL-3.0-or-later') 
depends=('ncurses')
makedepends=('clang' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba77b1b76f2cd8cb5d26bc22a0608614d37a30445ce8869d98b93fb5302dc07e') 

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
