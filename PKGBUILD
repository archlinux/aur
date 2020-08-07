# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reflac
pkgver=2.0.0
pkgrel=1
pkgdesc="Recompresses FLAC files while preserving tags"
arch=('any')
url="https://github.com/chungy/reflac"
depends=('flac')
makedepends=('asciidoc')
license=('ISC')
source=("$url"/archive/"$pkgver".tar.gz)
b2sums=('3a6ea9044aba9d09ac0f561c9e63f0b7e86d387d1d03e5056509da57d74be7dc2309cf79cbcbcd01aa8b5e3871d674c7d5364541c2b169f964d6d022af31f51d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/reflac/COPYING
}
