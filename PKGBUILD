# Maintainer: Unix Sheikh <unixsheikh at protonmail dot com>

pkgname=salahtime
pkgver=1.0.2
pkgrel=1
url="https://github.com/unixsheikh/salahtime"
pkgdesc="A small command line application written in Go that displays the Islamic prayer times for Europe/Copenhagen"
arch=('any')
license=('The Unlicense')

source=("https://github.com/unixsheikh/salahtime/archive/1.0.2.zip")
md5sums=('3f983739d72510114cb5f5de3908e3ed')

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
