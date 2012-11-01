# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

_author=dsb
_perlmod=Env-Path
pkgname=perl-env-path
pkgver=0.18
pkgrel=3
pkgdesc="Perl module Env::Path - Advanced operations on path variables"
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver"
options=(!emptydirs)
depends=('perl')
provides=('perl-env-path=0.18' 'perl-env-path=0.18')
source=("http://search.cpan.org/CPAN/authors/id/D/DS/DSB/$_perlmod-$pkgver.tar.gz")
md5sums=('3be7b2f3521eb604d621f6fdf36b86da')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "$srcdir/$_perlmod-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "$srcdir/$_perlmod-$pkgver"
  make install
}

# vim:set ts=2 sw=2 et:
