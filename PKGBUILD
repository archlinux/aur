# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=yabasic
pkgver=2.92.1
pkgrel=1
pkgdesc="Yet Another Basic"
arch=('i686' 'x86_64')
license=('MIT')
url="https://2484.de/yabasic/"
depends=('glibc' 'libx11' 'ncurses' 'libffi')
makedepends=('libxt')
source=("https://2484.de/yabasic/download/$pkgname-$pkgver.tar.gz")
sha256sums=('55e41c0c61b14375e97f3ea961bc0b72751f4598e40e0b020ac56da979b646a9')

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

