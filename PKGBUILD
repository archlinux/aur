# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-graph-easy'
pkgver='0.75'
pkgrel='1'
pkgdesc="Convert or render graphs (as ASCII, HTML, SVG or via Graphviz)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Graph-Easy'
source=('http://search.mcpan.org/CPAN/authors/id/S/SH/SHLOMIF/Graph-Easy-0.75.tar.gz')
md5sums=('8a4536760de1920586d3509355caa9f7')
sha512sums=('55b2dd59c8623117e482be4886475e50ce12297a3fd5b7abae1c76e3cdedd01280a62b596009da2f4da1e6ccbe4885ad0a14f7202716d85732f7646fe44c9af8')
_distdir="Graph-Easy-0.75"

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
