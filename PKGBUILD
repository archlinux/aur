# Originally submitted by: Gwenn Gueguen <arch@grumly.info>

pkgname=engine_pkcs11
pkgver=0.1.8
pkgrel=3
pkgdesc="Implementation of a PKCS11 engine for OpenSSL"
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/opensc/wiki/$pkgname"
license=("BSD")
depends=('zlib' 'openssl>=0.9.7d' 'libp11')
source=(http://downloads.sourceforge.net/opensc/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('693b402eafba152666e66431ed4c1b9e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="${pkgdir}/" install
}

