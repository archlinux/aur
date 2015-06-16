# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-font-freetype'
pkgver='0.03'
pkgrel='1'
pkgdesc="read font files and render glyphs from Perl using FreeType2"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('freetype2>=2.5.0.1' 'perl')
makedepends=()
url='http://search.cpan.org/dist/Font-FreeType'
source=('http://search.cpan.org/CPAN/authors/id/G/GE/GEOFFR/Font-FreeType-0.03.tar.gz')
md5sums=('47b9483c92f1b2df0bbb5258a6a596b2')
sha512sums=('fb10e09e7ce1a85a23e3d4e4fc6fbcf05a910b61f75117d09f464c1d68f59b624343b079d03b0787df0493f003c80a8e4bf9c72557c2763a39ed9af2deb622cd')
_distdir="Font-FreeType-0.03"

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
