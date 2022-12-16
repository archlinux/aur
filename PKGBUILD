# Maintainer: Kazuki Yamaguchi <k@rhe.jp>

pkgname=cproto
pkgver=4.7u
pkgrel=1
pkgdesc="A program that generates function prototypes and variable declarations from C source code."
arch=('i686' 'x86_64')
url="http://invisible-island.net/cproto/cproto.html"
license=('custom:public domain')
source=("https://invisible-island.net/archives/cproto/cproto-${pkgver}.tgz")
sha256sums=('64ebbbcc5e0501aff296f431d06f9fb70863afe5b0ce66c3b3479072914fc51e')

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
