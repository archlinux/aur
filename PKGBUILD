# Maintainer: Kyle Keen <keenerd [at] gmail.com>
# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>

pkgname=an
pkgver=1.2
pkgrel=1
pkgdesc="Anagram Generator"
arch=('i686' 'x86_64')
url="https://alioth.debian.org/projects/anagram/"
license=('GPL2')
depends=('words' 'icu')
source=("$pkgname-$pkgver.tar.bz2::http://ftp.debian.org/debian/pool/main/a/an/an_${pkgver}.orig.tar.xz")
md5sums=('1f3465bfe2cc4458f75a7a42037b475c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 an "$pkgdir/usr/bin/an"
  install -D -m 644 an.6 "$pkgdir/usr/share/man/man6/an.6"
}
