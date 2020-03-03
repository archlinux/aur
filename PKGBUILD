# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-BIMI'
_modnamespace=Mail
pkgname=perl-mail-bimi
pkgver=1.20200226
pkgrel=1
pkgdesc="BIMI object"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-mail-authenticationresults' 'perl-mail-dmarc' 'perl-moo' 'perl-net-dns' 'perl-type-tiny')
makedepends=('perl-mail-spf' 'perl-net-dns-resolver-mock' 'perl-test-class' 'perl-test-exception' 'perl-test-simple')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('0fb3a3c77afa986618c3c926bfb4fb5131b4e5595466959c41cdcf5d89f383f9')

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
