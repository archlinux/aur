# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reflac
pkgver=1.5.3
pkgrel=1
pkgdesc="Recompresses FLAC files while preserving tags"
arch=('any')
url="https://github.com/chungy/reflac"
depends=('flac')
makedepends=('asciidoc')
license=('ISC')
source=("$url"/archive/"$pkgver".tar.gz)
sha512sums=('61fac4e80aac07fb4afdb801abab63f552785eec650c35e495377e40fe04f2991f67d5805f4f7b133259e6106812a95a7983a296904340927669b1481838e587')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/reflac/COPYING
}
