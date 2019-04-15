# Maintainer: Kazuki Yamaguchi <k@rhe.jp>

pkgname=cproto
pkgver=4.7m
pkgrel=1
pkgdesc="Cproto is a program that generates function prototypes and variable declarations from C source code."
arch=('i686' 'x86_64')
url="http://invisible-island.net/cproto/cproto.html"
license=('custom:public domain')
depends=()
makedepends=()
source=("ftp://ftp.invisible-island.net/pub/cproto/cproto-4.7o.tgz")
sha256sums=('c76b0b72064e59709459bb7d75d6ec929f77ce5ae7f2610d169ba0fa20ccb44f')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
