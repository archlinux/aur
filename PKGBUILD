# $Id: PKGBUILD 9978 2008-08-21 12:43:50Z allan $
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>

pkgname=yabasic
pkgver=2.78.0
pkgrel=1
pkgdesc="Yet Another Basic"
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.yabasic.de/"
depends=('libx11' 'libsm' 'ncurses')
makedepends=('libxt')
source=("http://www.yabasic.de/download/$pkgname-$pkgver.tar.gz")
sha256sums=('ec535c7e35402f367734843a9a123097e673abba75d55a2b5f4e58026f57dd4d')

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
