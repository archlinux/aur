# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-multidimensional'
pkgver='0.014'
pkgrel='1'
pkgdesc="disables multidimensional array emulation"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-op-check>=0.19' 'perl>=5.12')
makedepends=('perl-extutils-depends')
url='https://metacpan.org/release/multidimensional'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/multidimensional-0.014.tar.gz')
sha512sums=('94c9dabb3023165a8dd140ef791e4aab980e3b604eae06ed0e29290aab67a9302f2cde4c8b394de0b4c55c5f78ce4510db902d615d665bf60b12ec409f341043')
_distdir="multidimensional-0.014"

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
