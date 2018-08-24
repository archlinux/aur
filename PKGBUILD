# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-b-keywords'
pkgver='1.19'
pkgrel='1'
pkgdesc="Lists of reserved barewords and symbol names"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/B-Keywords'
source=('http://search.mcpan.org/CPAN/authors/id/R/RU/RURBAN/B-Keywords-1.19.tar.gz')
sha512sums=('b6c4d858a16754b3606894fe3133e3057c49526b6def135ca5c21ea3c0c67d23cbd4e95fe62166bb2465fe15621a25b3f336b9ba6a1fa5d2f68a1a944f578af9')
_distdir="B-Keywords-1.19"

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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
