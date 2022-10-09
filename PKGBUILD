# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Egan McComb <egan.mccomb@gmail.com>

pkgname=tint-tetris
_realname=tint
pkgver=0.07
pkgrel=1
pkgdesc="Tetris clone for text based terminal"
arch=('i686' 'x86_64')
url="https://packages.qa.debian.org/t/tint.html"
license=('BSD')
depends=('ncurses')
source=(http://http.debian.net/debian/pool/main/t/tint/"$_realname"_"$pkgver".tar.xz)
md5sums=('f6360a9d96f0821d2aee1095c91a9a1f')

build() {
  cd "$srcdir/$_realname-$pkgver"
  sed -i "s#/usr/games#/usr/bin#" Makefile
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  install -Dm644 debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 tint "$pkgdir/usr/bin/tint"
}
