# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Crypt-OpenSSL-Verify'
_modnamespace=Crypt/TIMLEGGE
pkgname=perl-crypt-openssl-verify
pkgver=0.38
pkgrel=1
pkgdesc="OpenSSL Verify certificate verification in XS."
arch=("x86_64" "i686")
url="http://search.cpan.org/dist/$_perlmod"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl' 'perl-crypt-openssl-x509')
makedepends=('perl-file-slurper' 'perl-test-exception')
options=('!emptydirs')
source=("https://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('25c60e4895451f40140630a62b587ded3bee5ca1ba547477a08e5b5ec905023f')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
