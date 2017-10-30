# Contributor: Rasmus Steinke <rasi at xssn at>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-section-simple'
pkgver='0.07'
pkgrel='1'
pkgdesc="Read data from __DATA__"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/Data-Section-Simple'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Data-Section-Simple-0.07.tar.gz')
md5sums=('5a079d3d7712fa3c8256494cf026a153')
sha512sums=('77478498b3d760423794581e4b4589072ea31f3f536bc2def9336aaee32c007624f3fcc66978c9a8a90cdd4ff91edfb95347afaf48d386271e1594eaaf4420fb')
_distdir="Data-Section-Simple-0.07"

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
