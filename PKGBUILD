# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reflac
pkgver=0.1
pkgrel=1
pkgdesc="Recompresses FLAC files while preserving tags"
arch=('any')
url="https://github.com/chungy/reflac"
depends=('sh')
makedepends=('asciidoc')
license=('ISC')
source=(https://github.com/chungy/reflac/archive/0.1.tar.gz)
sha256sums=(2f8db60d5dcd13e6c3868f96e0058edcb0dc1293b2fd97bb7996737e1cdd4526)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/reflac/COPYING
}
