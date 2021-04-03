# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=perl-tap-formatter-camelcade
pkgver=2021.1
pkgrel=1
pkgdesc='Converts test events from TAP::Harness to the TeamCity format'
_dist=TAP-Formatter-Camelcade
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HU/HURRICUP/$_dist-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="$pkgdir"
}

sha256sums=('6b14237fd75c6070836f6cc4d6cc174fda5c1e36a22687d3f4ddee7053758673')
