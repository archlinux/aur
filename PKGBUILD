# Maintainer: Ryan Delaney <ryan dot patrick dot delaney at proton dot me>
# Contributor: Kyle Keen <keenerd [at] gmail.com>
# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>

pkgname=an
pkgver=1.2
pkgrel=2
pkgdesc="Anagram Generator"
arch=('i686' 'x86_64')
url="https://alioth.debian.org/projects/anagram/"
license=('GPL2')
depends=('words' 'icu')
source=("$pkgname-$pkgver.tar.gz::http://ftp.debian.org/debian/pool/main/a/an/an_${pkgver}.orig.tar.gz")
md5sums=('5d28b8003a745f0110ed70f0cd4aa051')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 an "$pkgdir/usr/bin/an"
  install -D -m 644 an.6 "$pkgdir/usr/share/man/man6/an.6"
}
