# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-csv-xs'
pkgver='1.33'
pkgrel='1'
pkgdesc="comma-separated values manipulation routines"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Text-CSV_XS'
source=("http://search.cpan.org/CPAN/authors/id/H/HM/HMBRAND/Text-CSV_XS-${pkgver}.tgz")
md5sums=('7b48e2fbf433aeb2d69a9aac19666dda')
sha512sums=('f6a18e57ee2d4e1f305af02922d081c487458453d0553166d1ce01de92f2b779a6b227e7136f37532c2614634f4192b699ef06526c1ca624ed4bd3daacbee35b')
_distdir="Text-CSV_XS-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
