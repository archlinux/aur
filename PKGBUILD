# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-graphics-colorutils'
pkgver='0.17'
pkgrel='1'
pkgdesc="Easy-to-use color space conversions and more."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Graphics-ColorUtils'
source=(http://search.cpan.org/CPAN/authors/id/J/JA/JANERT/Graphics-ColorUtils-${pkgver}.tar.gz)
md5sums=('3250d1acda77dbebfd05094b97667642')
sha512sums=('c2b2ee98a180ddcc471beb04f90e08b4a6328ae3bd646ef70d95aba2fd795e8439d8800e672342fed8a4d2f605d1ed948659ddcc76dcdc23d67c6b107bddc24b')
_distdir="Graphics-ColorUtils-0.17"

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
