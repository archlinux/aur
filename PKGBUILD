# Maintainer: awe00 < awe00 AT hotmail DOT fr>
pkgname=perl-eval-context
pkgver=0.09.11
pkgrel=1
pkgdesc='This module define a subroutine that let you evaluate Perl code in a specific context.'
_dist=Eval-Context
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-package-generator)
makedepends=(perl-test-output perl-test-block perl-directory-scratch-structured)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/N/NK/NKH/$_dist-$pkgver.tar.gz")
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
#  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
