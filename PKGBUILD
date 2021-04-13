# Maintainer: Kazuki Yamaguchi <k@rhe.jp>

pkgname=cproto
pkgver=4.7s
pkgrel=1
pkgdesc="A program that generates function prototypes and variable declarations from C source code."
arch=('i686' 'x86_64')
url="http://invisible-island.net/cproto/cproto.html"
license=('custom:public domain')
source=("ftp://ftp.invisible-island.net/pub/cproto/cproto-${pkgver}.tgz")
sha256sums=('842f28a811f58aa196b77763e08811c2af00472c0ea363d397a545046d623545')

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
