# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-text-glob'
pkgver='0.09'
pkgrel='3'
pkgdesc="match globbing patterns against text"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Text-Glob'
source=('http://search.mcpan.org/CPAN/authors/id/R/RC/RCLAMP/Text-Glob-0.09.tar.gz')
md5sums=('1daa10e087f891c49b720a5c551a024b')
sha512sums=('9b729e4ece88ad79e1b637c7f35e5e1ecae3fd7f62c408ed4f3fcac2e8e8afff32d7d805e1b0269800aada5ae609d03335d42ac54def2797d301e91fa488ae47')
_distdir="Text-Glob-0.09"

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
