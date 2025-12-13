# Maintainer: Marek Küthe <m.k@mk16.de>

pkgname=mping
pkgver=2.0
pkgrel=1
pkgdesc="a simple multicast ping program"
arch=('x86_64')
url="https://github.com/troglobit/mping/"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::${url}archive/refs/tags/v$pkgver.tar.gz")
sha512sums=(247fba93f086a75f881618644980a447b4a8a6cccbd03b1e8afc89b8d1ddfc7b964a0bad3bca204473f39722bf59caf9e0427c17c10d6f602afd6bfb5d09e3d9)

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" prefix="/usr" install
  install -pDm644 ChangeLog.md "$pkgdir/usr/share/doc/$pkgname/ChangeLog.md"
}
