# Maintainer: Kazuki Yamaguchi <k@rhe.jp>

pkgname=cproto
pkgver=4.8
pkgrel=1
pkgdesc="A program that generates function prototypes and variable declarations from C source code."
arch=('i686' 'x86_64')
url="http://invisible-island.net/cproto/cproto.html"
license=('custom:public domain')
source=("https://invisible-island.net/archives/cproto/cproto-${pkgver}.tgz"{,.asc})
sha256sums=('0cccb93447682c7fdb4f0bdbfbe05d52a827331e0a19a5215d2c3cb85ad29258'
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
