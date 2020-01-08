# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-DMARC'
_modnamespace=Mail
pkgname=perl-mail-dmarc
pkgver=1.20200108
pkgrel=1
pkgdesc="Perl implementation of DMARC"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-cgi' 'perl-config-tiny' 'perl-dbd-sqlite' 'perl-dbix-simple' 'perl-email-mime' 'perl-email-simple' 'perl-file-sharedir' 'perl-http-message' 'perl-io-socket-ssl' 'perl-json' 'perl-libwww' 'perl-mail-dkim' 'perl-module-build' 'perl-net-dns' 'perl-net-http' 'perl-net-idn-encode' 'perl-net-ip' 'perl-net-smtps' 'perl-net-ssleay' 'perl-net-server' 'perl-regexp-common' 'perl-socket6' 'perl-uri' 'perl-xml-libxml')
makedepends=('perl-test-file-sharedir' 'perl-test-exception' 'perl-test-output')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('5d0420bbac05edbe9c93226a17a4959e2c75e8f5ac90c15507d530b75123787b')

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
