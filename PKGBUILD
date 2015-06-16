# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-text-csv-xs'
pkgver='1.18'
pkgrel='1'
pkgdesc="comma-separated values manipulation routines"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Text-CSV_XS'
source=('http://search.cpan.org/CPAN/authors/id/H/HM/HMBRAND/Text-CSV_XS-1.18.tgz')
md5sums=('510791081d14d6ad4b53511d5d0aed60')
sha512sums=('d6cf1f051c9f5a4bda80acde94709010010213f29f41305c92eb6f775ba443acbdebcc18bc1f1c0efc7144211c47ba7881ce222f264741de885fe15764eb7f19')
_distdir="Text-CSV_XS-1.18"

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
