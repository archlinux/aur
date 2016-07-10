# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reflac
pkgver=1.2.3
pkgrel=1
pkgdesc="Recompresses FLAC files while preserving tags"
arch=('any')
url="https://github.com/chungy/reflac"
depends=('flac')
makedepends=('asciidoc')
license=('ISC')
source=("$url"/archive/"$pkgver".tar.gz)
sha256sums=('ee3ec5e9d5acc0e3dce39f53ab9a062db581971903c420d43953ae7e501dbff0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr DESTDIR="$pkgdir" install
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/reflac/COPYING
}
