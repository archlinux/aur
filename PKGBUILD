# Maintainer: Jorge Silva <j0rj@posteo.net>

pkgname=stklos
pkgver=1.31
pkgrel=1
pkgdesc="Free R5RS Scheme system."
arch=('i686' 'x86_64')
url="http://www.stklos.net"
license=('GPL')
depends=('readline' 'gmp' 'pcre' 'libffi' 'gc')
source=("http://www.stklos.net/download/$pkgname-$pkgver.tar.gz")
sha256sums=('b67910a7eb2124950751766d1b498a9e3acda80dad73c948398db7c72868bcc2')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-threads=pthreads
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
