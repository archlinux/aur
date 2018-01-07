# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: Bob Gregory <pathogenix@gmail.com>

pkgname=libfastjson
pkgver=0.99.7
pkgrel=1
pkgdesc="A performance-focused json library for C"
arch=('x86_64')
url="https://github.com/rsyslog/libfastjson"
license=('GPL')
depends=()
source=($pkgname-$pkgver.tar.gz::https://github.com/rsyslog/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('a142a6e5fa5c9c4ac32615c42fc663a1a14bff305c922e55192b6abf7d1ce1d8')

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
