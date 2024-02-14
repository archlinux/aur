# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-Milter-Authentication-Handler-SMIME'
_modnamespace=Mail
pkgname=perl-mail-milter-authentication-handler-smime
pkgver=2.20180510
pkgrel=2
pkgdesc="Authentication Milter Module for validation of SMIME"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-mail-milter-authentication' 'perl-convert-x509' 'perl-crypt-smime')
makedepends=('perl-test-perl-critic')
checkdepends=('perl-net-dns-resolver-mock')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('be26a02d6848faee2e850f4d7ac8fe7d9fe5449e153c3cf08a6c3acb80d31237')

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
