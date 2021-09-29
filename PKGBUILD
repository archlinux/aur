# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Bob Gregory <pathogenix@gmail.com>

pkgname=libfastjson
pkgver=0.99.9
pkgrel=2
pkgdesc="A performance-focused json library for C"
arch=('x86_64' 'i686')
url="https://github.com/rsyslog/libfastjson"
license=('GPL')
depends=()
source=($pkgname-$pkgver.tar.gz::https://github.com/rsyslog/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('881f954633aa76931e4c756ece0bda6fd8a673c6e66955a3db3b2bb9d6bbff72')

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
