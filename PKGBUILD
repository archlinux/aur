# Maintainer: CTech <ctech.exe@gmail.com>
pkgname=perl-crypt-pkcs10
_pkgname=Crypt-PKCS10
pkgver=1.4
pkgrel=1
pkgdesc="Crypt::PKCS10 parses PKCS #10 certificate requests (CSRs) and provides accessor methods to extract the data in usable form."
arch=('any')
url="http://search.cpan.org/~tlhackque/Crypt-PKCS10/lib/Crypt/PKCS10.pm"
license=('GPL')
depends=('perl-convert-asn1' 'perl-module-signature')
provides=(perl-crypt-pkcs10)
source=("http://search.cpan.org/CPAN/authors/id/T/TL/TLHACKQUE/$_pkgname-$pkgver.tar.gz")
md5sums=('f54998b9798859697239b2d0f995e9c6')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
