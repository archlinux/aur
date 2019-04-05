# Maintainer: Unix Sheikh <unixsheikh at protonmail dot com>

pkgname=salahtime
pkgver=1.0.0
pkgrel=1
url="https://github.com/unixsheikh/salahtime"
pkgdesc="A small C program for displaying the Islamic prayer time for Copenhagen in Denmark"
arch=('any')
license=('The Unlicense')

source=("https://github.com/unixsheikh/salahtime/archive/1.0.0.zip")
md5sums=('c011e5eb216961d7f71579612c2adec9')

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
