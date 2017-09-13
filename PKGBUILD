# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=yabasic
pkgver=2.78.2
pkgrel=1
pkgdesc="Yet Another Basic"
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.yabasic.de/"
depends=('libx11' 'ncurses')
makedepends=('libxt')
source=("http://www.yabasic.de/download/$pkgname-$pkgver.tar.gz")
sha256sums=('491581b44ab7ea4707b5021b57df0d1880a621097bcc10e2b50e70c3524f1211')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
