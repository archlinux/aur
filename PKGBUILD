# Maintainer: Jimmy Xu <me at jimmyxu dot org>

_perlmod='Mail-DataFeed-Abusix'
_modnamespace=Mail
pkgname=perl-mail-datafeed-abusix
pkgver=2.20210112
pkgrel=1
pkgdesc="Send SMTP transaction data to the Abusix transaction feed"
arch=("any")
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-moo')
makedepends=('perl-test-exception' 'perl-test-simple')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
sha256sums=('295238c43ce1a46e55e3aee41618308eede1de6e55a426b7ecb04a501a26acc3')

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
