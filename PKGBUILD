# Maintainer: M0Rf30
pkgname=libpki
pkgver=0.8.8
pkgrel=2
pkgdesc="Provides an easy-to-use PKI library for PKI enabled application development"
arch=('i686' 'x86_64')
url="https://pki.openca.org"
license=('GPL2')
depends=('openssl' 'libldap' 'libmysqlclient' 'postgresql-libs' 'libxml2')
options=('!libtool')
source=("http://prdownloads.sourceforge.net/project/openca/$pkgname/releases/v$pkgver/sources/$pkgname-$pkgver.tar.gz")


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/lib
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv $pkgdir/usr/etc $pkgdir/
}

md5sums=('055638d609fbbaa0f7d4242ceaf2b1b7')
