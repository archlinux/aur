# Maintainer: Unix Sheikh <unixsheikh at protonmail dot com>

pkgname=salahtime
pkgver=1.0.1
pkgrel=1
url="https://github.com/unixsheikh/salahtime"
pkgdesc="A small C program for displaying the Islamic prayer time for Europe/Copenhagen"
arch=('any')
license=('The Unlicense')

source=("https://github.com/unixsheikh/salahtime/archive/1.0.1.zip")
md5sums=('a5b1e4272d32ea63fc635a3614222124')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CC=gcc
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "salahtime" "$pkgdir/usr/bin/salahtime"
  gzip salahtime.1
  install -Dm755 "salahtime.1.gz" "$pkgdir/usr/share/man/man1/salahtime.1.gz"
}
