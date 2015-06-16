# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-multidimensional'
pkgver='0.011'
pkgrel='2'
pkgdesc="disables multidimensional array emulation"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-op-check>=0.19' 'perl-lexical-sealrequirehints>=0.005')
makedepends=()
url='http://search.mcpan.org/dist/multidimensional'
source=('http://search.mcpan.org/CPAN/authors/id/I/IL/ILMARI/multidimensional-0.011.tar.gz')
md5sums=('f1f75d5b65d16f73a4c145707b9ff2e6')
sha512sums=('8e121388b1325b6cfb73a74a9655f28ce52059096a9a8326bbe743cf663523812f3d171c1cf5d1b4841b98ec57c4240130d6def3e064e809db1d1bd4c4510081')
_distdir="multidimensional-0.011"

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
