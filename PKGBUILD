# CPAN Name  : AI-DecisionTree
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-ai-decisiontree'
pkgver='0.11'
pkgrel='1'
pkgdesc="Automatically Learns Decision Trees"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-graphviz>=0')
makedepends=()
url='https://metacpan.org/release/AI-DecisionTree'
source=('http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/AI-DecisionTree-0.11.tar.gz')
md5sums=('ab18666204a5363ced7f6a2eafd9da7f')
sha512sums=('9180df9ddc22881384051d61be960c7ac54ae9bf250fc102acd7899f56a40d2065a80f74799b1d456ea34e6364aa1d43227989ece0150714a96935e81cf7b218')
_distdir="AI-DecisionTree-0.11"

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
