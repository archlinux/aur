# Maintainer: Kazuki Yamaguchi <k@rhe.jp>

pkgname=cproto
pkgver=4.7y
pkgrel=1
pkgdesc="A program that generates function prototypes and variable declarations from C source code."
arch=('i686' 'x86_64')
url="http://invisible-island.net/cproto/cproto.html"
license=('custom:public domain')
source=("https://invisible-island.net/archives/cproto/cproto-${pkgver}.tgz"{,.asc})
sha256sums=('0bd1d8be8ff0a4ca43f947f95750d34f64eda93c9e2ca79100fd60140b7c6331'
            'SKIP')
validpgpkeys=('19882D92DDA4C400C22C0D56CC2AF4472167BE03') # Thomas E. Dickey (self-signed w/o SHA1) <dickey@invisible-island.net>

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
