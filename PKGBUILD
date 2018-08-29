# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=intel-undervolt
pkgver=1.5
pkgrel=1
pkgdesc='Intel CPU undervolting tool'
arch=('any')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
backup=(etc/intel-undervolt.conf)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('cf30fb2651eee8bb15e89be7964157ebe0aeeb1bb518ec1706cd508b147348f4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
