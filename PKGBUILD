# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-css-minifier-xs'
pkgver='0.09'
pkgrel='1'
pkgdesc="XS based CSS minifier"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/CSS-Minifier-XS'
source=('http://search.cpan.org/CPAN/authors/id/G/GT/GTERMARS/CSS-Minifier-XS-0.09.tar.gz')
md5sums=('583722bcd6175fcafaff63c769accc6f')
sha512sums=('520e40fa4a6d70bd7692880f3bc5c813a8648dfe12946426dedf0874e180ccd98e703d67ed8b502a7b00489aa2404edce844d80b1eccc48f94156a0d5c36ad51')
_distdir="CSS-Minifier-XS-0.09"

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
