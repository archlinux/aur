# Maintainer: Egan McComb <egan.mccomb@gmail.com>

pkgname=tint-tetris
_realname=tint
pkgver=0.04+nmu1
pkgrel=1
pkgdesc="TINT Is Not Tetris(tm) ...at least the name isn't"
arch=('i686' 'x86_64')
url="https://packages.debian.org/jessie/tint"
license=('BSD')
groups=()
depends=('ncurses>=5.7')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://http.debian.net/debian/pool/main/t/tint/"$_realname"_"$pkgver".tar.gz)
noextract=()
md5sums=('40e4674fcf2531c638cc32b6b09123aa')

build() {
  cd "$srcdir/$_realname-$pkgver"
  sed -i "s#/var/games#$HOME/.tint#" Makefile
  sed -i "s#/usr/games#/usr/bin#" Makefile
  make || return 1
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  install -Dm644 debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 tint "$pkgdir/usr/bin/tint"
}
