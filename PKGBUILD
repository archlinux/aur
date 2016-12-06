# $Id: PKGBUILD 9978 2008-08-21 12:43:50Z allan $
# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>

pkgname=yabasic
pkgver=2.77.1
pkgrel=1
pkgdesc="Yet Another Basic"
arch=('i686' 'x86_64')
license=('GPL2' 'MIT')
url="http://www.yabasic.de/"
depends=('libx11' 'libsm' 'ncurses')
makedepends=('libxt')
source=("http://www.yabasic.de/download/$pkgname-$pkgver.tar.gz")
sha256sums=('ea39ae1bdcff964cbd9deda5fd50b21200dcb7ff240471a23a2cf0ce654c5f21')

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
