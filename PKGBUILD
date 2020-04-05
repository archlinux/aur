# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-DataFeed-Abusix'
_modnamespace=Mail
pkgname=perl-mail-datafeed-abusix
pkgver=1.20200331.1
pkgrel=1
pkgdesc="Send SMTP transaction data to the Abusix transaction feed"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-moo')
makedepends=('perl-test-exception' 'perl-test-simple')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('136ca4a4b227fa94c09ae63175e7450c76cb1c1e5c000d92eb1f88ec26c3b632')

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
