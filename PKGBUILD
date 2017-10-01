# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-multidimensional'
pkgver='0.013'
pkgrel='1'
pkgdesc="disables multidimensional array emulation"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-op-check>=0.19' 'perl-lexical-sealrequirehints>=0.005' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/multidimensional'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/multidimensional-0.013.tar.gz')
md5sums=('60113584ddf6daf651998b7f01cf2cc4')
sha512sums=('9abc93efd0060042f16c9e89c37a11a08c781ab2d095964701661a17f4adfeaf7cf3cb134db9c91a366b5ddda482716eda5d3b002fdb38fa4694d7e24dbc76f6')
_distdir="multidimensional-0.013"

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
