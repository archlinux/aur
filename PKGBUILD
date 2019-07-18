# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=charge-log
pkgver=1.0
pkgrel=1
pkgdesc='Battery charge history logger'
arch=('any')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=('gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5577555a304819606571af71578a11a2d19bda9dbe09f8380f384491cb0b96a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --enable-systemd --enable-gtk3
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
