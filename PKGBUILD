# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reflac
pkgver=1.3
pkgrel=1
pkgdesc="Recompresses FLAC files while preserving tags"
arch=('any')
url="https://github.com/chungy/reflac"
depends=('flac')
makedepends=('asciidoc')
license=('ISC')
source=("$url"/archive/"$pkgver".tar.gz)
sha256sums=('8b06cba8bc6302d919ac20a0f30637dce99675413120757f0718f7de30cccead')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/reflac/COPYING
}
