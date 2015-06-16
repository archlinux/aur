# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-eval-withlexicals'
pkgver='1.003002'
pkgrel='1'
pkgdesc="pure perl eval with persistent lexical variables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=0.009006' 'perl' 'perl-strictures')
makedepends=()
url='http://search.mcpan.org/dist/Eval-WithLexicals'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/Eval-WithLexicals-1.003002.tar.gz')
md5sums=('a47dcb41ca639d3cae57191744ba72d3')
sha512sums=('d7a540a5ae14fb5ee649599ca3979ae07268c54ca14814544b6836ded2ba50345a7bf5b19653d6b48ddee51587701a0419bec81131e7f45b299e3ad88a3e16bf')
_distdir="Eval-WithLexicals-1.003002"

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
