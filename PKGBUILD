# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-metacpan-api'
pkgver='0.50'
pkgrel='1'
pkgdesc="A comprehensive, DWIM-featured API to MetaCPAN (DEPRECATED)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json' 'perl-moo>=1.000001' 'perl-try-tiny' 'perl-type-tiny' 'perl-uri' 'perl-namespace-autoclean')
makedepends=('perl>=5.006')
checkdepends=('perl-test-fatal' 'perl-test-requiresinternet' 'perl-test-tinymocker')
url='https://metacpan.org/release/MetaCPAN-API'
source=('http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/MetaCPAN-API-0.50.tar.gz')
md5sums=('06967b570f5eae2ef627c3667e40a55f')
sha512sums=('1c57a1f80a8907f17a7586b2fd973c0eda63d4bf13714542c14bf02f361428fcf06b95125d6b1998eb70b2129973404d32dabe2ae213ad23bdc29893a42f06bc')
_distdir="MetaCPAN-API-0.50"

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
