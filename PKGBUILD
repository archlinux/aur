# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=git-debubble
pkgver=1.1
pkgrel=1
pkgdesc="Clean up merge bubbles in a Git repository"
arch=('any')
depends=('git')
makedepends=('asciidoc')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("http://www.catb.org/esr/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6b2cd99cea708a06b96068eedaa402ce61a50870cd734e446055312da031b6ef')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
