# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-bio-graphics'
pkgver='2.37'
pkgrel='1'
pkgdesc="Generate GD images of Bio::Seq objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-bioperl' 'perl-gd>=2.3' 'perl-statistics-descriptive>=2.6')
makedepends=()
url='http://search.cpan.org/dist/Bio-Graphics'
source=('http://search.cpan.org/CPAN/authors/id/L/LD/LDS/Bio-Graphics-2.37.tar.gz')
md5sums=('f1b0422c8138a79d6c4741024dd182a4')
sha512sums=('f8858f018ece0cf174d6803f0fe1110099ba5b2b6f0a1452db361949320aeccb7738f588fe2ac5c642d2b9b5e449a0c7822c0da1ceda91e5f1ffbac07ce3fcbe')
_distdir="Bio-Graphics-2.37"

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
