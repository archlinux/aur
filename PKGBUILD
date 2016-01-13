# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-graph'
pkgver='0.9704'
pkgrel='1'
pkgdesc="graph data structures and algorithms"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Graph'
source=('http://search.cpan.org/CPAN/authors/id/J/JH/JHI/Graph-0.9704.tar.gz')
md5sums=('1ab4e49420e56eeb1bc81d842aa8f3af')
sha512sums=('1eed5049577112cc2e41a83f6b3b6a22a08170597b5cb89e2eab6cc68386bfd989d3953d7ceab85bcfbd7d097a6925bd8eb43f48eed1ac07469ea4b2432149da')
_distdir="Graph-0.9704"

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
