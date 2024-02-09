# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-BIMI'
_modnamespace=Mail
pkgname=perl-mail-bimi
pkgver=3.20240205
pkgrel=1
pkgdesc="BIMI object"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-app-cmd' 'perl-cache-fastmmap' 'perl-capture-tiny' 'perl-class-load' 'perl-convert-asn1' 'perl-crypt-openssl-verify' 'perl-crypt-openssl-x509' 'perl-file-slurp' 'perl-http-tiny-paranoid' 'perl-import-into' 'perl-json' 'perl-mail-authenticationresults' 'perl-mail-dmarc' 'perl-mail-spf' 'perl-moo' 'perl-moose' 'perl-mozilla-ca' 'perl-net-dns' 'perl-pod-elemental' 'perl-pod-weaver' 'perl-sereal' 'perl-sub-install' 'perl-xml-libxml')
makedepends=('perl-net-dns-resolver-mock' 'perl-test-class' 'perl-test-differences' 'perl-test-exception' 'perl-test-requiresinternet')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('6e88696a876b0133cd2347f58825dbd796d2a0a3fabd1f5cd29d50c2f11b149a')

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
