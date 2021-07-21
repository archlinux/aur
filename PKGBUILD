# Maintainer: Unix Sheikh <unixsheikh at protonmail dot com>

pkgname=salahtime
pkgver=1.0.4
pkgrel=1
url="https://codeberg.org/unixsheikh/salahtime"
pkgdesc="A small command line application written in C that displays the Islamic prayer times"
arch=('any')
license=('CC BY 4.0')

source=("https://codeberg.org/unixsheikh/salahtime/archive/1.0.4.zip")
md5sums=('47ecdfead9a99ba996026390589e4e36')

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
