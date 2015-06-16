# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-env-ps1'
pkgver='0.06'
pkgrel='1'
pkgdesc="prompt string formatter"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Env-PS1'
source=('http://search.mcpan.org/CPAN/authors/id/R/RS/RSN/Env-PS1-0.06.tar.gz')
md5sums=('7e10da424e61d8c1031938d28712ee73')
sha512sums=('a7cde5350d10c055bbacf1e66cfd525301eafb4ae6e6452e88d3188ddbdc546a4c9af1b1e0bc40b64fe92120ab45618121f7fe6a60a87fc3dfe0eb9a018fa9ef')
_distdir="Env-PS1-0.06"

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
