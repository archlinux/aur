# Maintainer: Unix Sheikh <aur at unixsheikh dot com>

pkgname=salahtime
pkgver=1.1.0
pkgrel=1
url="https://codeberg.org/unixsheikh/salahtime"
pkgdesc="A small C program for displaying the Islamic prayer time for a specific city, defaults to Copenhagen in Denmark"
arch=('any')
license=('CC BY 4.0')

source=("https://codeberg.org/unixsheikh/salahtime/archive/1.1.0.zip")
md5sums=('f55f7d6c4b36e0733539bf013154d0e8')

build() {
  cd "$srcdir/$pkgname"
  make CC=gcc
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "salahtime" "$pkgdir/usr/bin/salahtime"
  gzip salahtime.1
  install -Dm755 "salahtime.1.gz" "$pkgdir/usr/share/man/man1/salahtime.1.gz"
}

