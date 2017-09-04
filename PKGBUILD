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
source=("ftp://ftp.invisible-island.net/pub/cproto/cproto-4.7m.tgz")
sha256sums=('4b482e80f1b492e94f8dcda74d25a7bd0381c870eb500c18e7970ceacdc07c89')

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
