# Maintainer: Kazuki Yamaguchi <k@rhe.jp>

pkgname=cproto
pkgver=4.7v
pkgrel=1
pkgdesc="A program that generates function prototypes and variable declarations from C source code."
arch=('i686' 'x86_64')
url="http://invisible-island.net/cproto/cproto.html"
license=('custom:public domain')
source=("https://invisible-island.net/archives/cproto/cproto-${pkgver}.tgz")
sha256sums=('f3dec3f6102770196976459c4b44ac27355f6120da76e5231ec1323e379d1511')

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
  make DESTDIR="$pkgdir" install
}
