# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-graph-easy'
pkgver='0.76'
pkgrel='1'
pkgdesc="Convert or render graphs (as ASCII, HTML, SVG or via Graphviz)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Graph-Easy'
source=("http://search.mcpan.org/CPAN/authors/id/S/SH/SHLOMIF/Graph-Easy-${pkgver}.tar.gz")
md5sums=('031064db5f254a02a462464832ff845c')
sha512sums=('c5f93252a047ccb0c02347f9f138217c1d52b10ba67db100de7d57a716b3da8d564ecbddedd795420eccc6fe4733bd9b3e64d1fda7d203b144c6112d6bfbe6d0')
_distdir="Graph-Easy-${pkgver}"

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
