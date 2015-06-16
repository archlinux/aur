# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-stem-snowball-da'
pkgver='1.01'
pkgrel='1'
pkgdesc="Porters stemming algorithm for Denmark"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Lingua-Stem-Snowball-Da'
source=('http://search.cpan.org/CPAN/authors/id/C/CI/CINE/Lingua-Stem-Snowball-Da-1.01.tar.gz')
md5sums=('e8d9a8285bce0c9e4bedc138cd6a1501')
sha512sums=('dc0d199640417e6c9f0e6bfaa175ae64e288a4879047d4e13060eaadad20fa9590421535a6097aebb3ca1dcc4f2c9ce5a08a6566a0f651c59d57dca169ada7fe')
_distdir="Lingua-Stem-Snowball-Da-1.01"

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
