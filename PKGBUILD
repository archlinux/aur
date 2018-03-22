# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Bob Gregory <pathogenix@gmail.com>

pkgname=libfastjson
pkgver=0.99.8
pkgrel=2
pkgdesc="A performance-focused json library for C"
arch=('x86_64' 'i686')
url="https://github.com/rsyslog/libfastjson"
license=('GPL')
depends=()
source=($pkgname-$pkgver.tar.gz::https://github.com/rsyslog/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('7e49057b26a5a9e3c6623e024f95f9fd9a14b571b9150aeb89d6d475fc3633e3')

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
