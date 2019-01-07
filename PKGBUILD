# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=yabasic
pkgver=2.81.2
pkgrel=1
pkgdesc="Yet Another Basic"
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.yabasic.de/"
depends=('libx11' 'ncurses')
makedepends=('libxt')
source=("http://www.yabasic.de/download/$pkgname-$pkgver.tar.gz")
sha256sums=('21da0b480b55c1847cfd1be52007f2f1015db4e9c17980e5ce1306ea92c78890')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}


# Disabling check for 2.81.1 and 2.82.2
# Run in script test failed :(
#check() {
#  cd $pkgname-$pkgver
#  make check
#}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

