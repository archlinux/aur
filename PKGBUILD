# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Crypt-OpenSSL-Verify'
_modnamespace=Crypt
pkgname=perl-crypt-openssl-verify
pkgver=0.36
pkgrel=1
pkgdesc="OpenSSL Verify certificate verification in XS."
arch=("x86_64" "i686")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-crypt-openssl-x509')
makedepends=('perl-file-slurper' 'perl-test-exception')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('deefdae6b14877f590f08c4eb50e3cd3710aa3ee62412c08d183f55b3af73e9e')

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
