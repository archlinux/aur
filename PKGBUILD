# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=unstickpixels
pkgver=3
pkgrel=1
pkgdesc="Screen loop to try to unstick stuck dots"
arch=(i686 x86_64)
url="https://github.com/maandree/unstickpixels"
license=('custom:ISC')
depends=(libgamma)
makedepends=(libgamma)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(8ae08fff8011916f403b46c0bd57689eaac9fb955b0c691b14fc5318d3fba2d4)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}
