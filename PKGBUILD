# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

_dist=Env-Path
pkgname=perl-env-path
pkgver=0.19
pkgrel=2
pkgdesc="Perl module Env::Path - Advanced operations on path variables"
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~dsb/$_dist-$pkgver"
options=(!emptydirs)
depends=('perl')
source=("http://search.cpan.org/CPAN/authors/id/D/DS/DSB/$_dist-$pkgver.tar.gz")
sha1sums=('0c4677e6d6e03a0bfaab877ac74bce55a519f49c')

build() {
  cd "$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

check() {
  cd "$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

# vim:set ts=2 sw=2 et:
