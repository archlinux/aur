pkgname=salahtime
pkgver=1.1.1
pkgrel=1
url="https://codeberg.org/unixdigest/salahtime"
pkgdesc="A small C program for displaying the Islamic prayer time for a specific city"
arch=('any')
license=('CC BY 4.0')

source=("https://codeberg.org/unixdigest/salahtime/archive/1.1.1.zip")
md5sums=('7cb94d03dc165491aef09aaeddf9da97')

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

