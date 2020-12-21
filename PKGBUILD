# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Crypt-OpenSSL-Verify'
_modnamespace=Crypt
pkgname=perl-crypt-openssl-verify
pkgver=0.23
pkgrel=1
pkgdesc="OpenSSL Verify certificate verification in XS."
arch=("x86_64" "i686")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-crypt-openssl-x509')
makedepends=('perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('fa3bc88efefbe7fc6a84dabe1a1202c0ef930392321afa4e4ab945717b831aed')

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
