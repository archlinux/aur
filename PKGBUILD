# $Id: PKGBUILD 9978 2008-08-21 12:43:50Z allan $
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>

pkgname=yabasic
pkgver=2.77.3
pkgrel=1
pkgdesc="Yet Another Basic"
arch=('i686' 'x86_64')
license=('GPL2' 'MIT')
url="http://www.yabasic.de/"
depends=('libx11' 'libsm' 'ncurses')
makedepends=('libxt')
source=("http://www.yabasic.de/download/$pkgname-$pkgver.tar.gz")
sha256sums=('5481d24ecb2647acc443bacb5d6ed83d2bcadde7f250b5d734e56264afc77be5')

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

  make prefix="$pkgdir"/usr install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
