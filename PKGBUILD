pkgname=libfastjson
pkgver=1.2304.0
pkgrel=1
pkgdesc="A performance-focused json library for C"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/rsyslog/libfastjson"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://github.com/rsyslog/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('6c18848c75b179108429fc2818273551c68ffe6ddd5e414c20c071c844befbc1')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fvi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
