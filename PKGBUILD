# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-b-keywords'
pkgver='1.20'
pkgrel='1'
pkgdesc="Lists of reserved barewords and symbol names"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/B-Keywords'
source=('http://search.mcpan.org/CPAN/authors/id/R/RU/RURBAN/B-Keywords-1.20.tar.gz')
sha512sums=('481eda4d1388901412e982a6c799fab0965f363c4549233e24793aee96ffad68da6045a79fb78c1e946ca48b6ec67d1d49a687801a19254e9c3db12b5e29cb0f')
_distdir="B-Keywords-1.20"

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
  find "$pkgdir" '(' -name .packlist -o -name perllocal.pod ')' -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
