# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=intel-undervolt
pkgver=1.6
pkgrel=1
pkgdesc='Intel CPU undervolting tool'
arch=('any')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
backup=(etc/intel-undervolt.conf)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8ec57c14a9f95eb29e3f6349b935c577fa1b8567e1c3c5337f9d11d05448815d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
