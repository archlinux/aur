# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Crypt-OpenSSL-Verify'
_modnamespace=Crypt
pkgname=perl-crypt-openssl-verify
pkgver=0.29
pkgrel=2
pkgdesc="OpenSSL Verify certificate verification in XS."
arch=("x86_64" "i686")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-crypt-openssl-x509')
makedepends=('perl-file-slurp' 'perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('ae0eb0086cba8454c6ed98aaddd2e69f18a55e776ebb411f85326225f45c3e2f')

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
