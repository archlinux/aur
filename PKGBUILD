# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=lid-switch-dpms
pkgver=1.0
pkgrel=1
pkgdesc='Blank and unblank the screen on lid switch'
arch=('any')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=('libdrm' 'libxext')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bba53dcfa12821285892d1a7ada757dfeaf4c35e199e9de2bc896e8c9c5eae83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
