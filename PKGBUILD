# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-test-requiresinternet'
pkgver='0.03'
pkgrel='1'
pkgdesc="Easily test network connectivity"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Test-RequiresInternet'
source=('http://search.mcpan.org/CPAN/authors/id/M/MA/MALLEN/Test-RequiresInternet-0.03.tar.gz')
md5sums=('503bc4914c4f7a0e411815b411caa504')
sha512sums=('a28e5165fec2c05b8cd544fea020a83da85e475938b880210a6daebd0554701f6c3bd31f06e8896f15638abad089537bc5ba00f467e7898e9d1978ee64fa82fd')
_distdir="Test-RequiresInternet-0.03"

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
