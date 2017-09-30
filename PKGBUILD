# Maintainer: awe00 < awe00 AT hotmail DOT fr>
pkgname=perl-check-isa
pkgver=0.09
pkgrel=1
pkgdesc='This module provides several functions to assist in testing whether a value is an object, and if so asking about its class.'
_dist=Check-ISA
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=()
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/$_dist-$pkgver.tar.gz")
md5sums=("SKIP")

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
