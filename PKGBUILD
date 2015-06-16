# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-number-compare'
pkgver='0.03'
pkgrel='3'
pkgdesc="numeric comparisons"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Number-Compare'
source=('http://search.mcpan.org/CPAN/authors/id/R/RC/RCLAMP/Number-Compare-0.03.tar.gz')
md5sums=('ded4085a8fc96328742785574ca65208')
sha512sums=('fc7efb0177bcb84142619b7d8c0252f4548e547650ddbe9cfafaba97b8ae791c20fbffa6f8b01449b9dd217d9914f94bfeaff57cdfdc2c11e2a1456992bd9893')
_distdir="Number-Compare-0.03"

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
