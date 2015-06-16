# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-pod-perldoc'
pkgver='3.23'
pkgrel='1'
pkgdesc="Look up Perl documentation in Pod format."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Pod-Perldoc'
source=('http://search.mcpan.org/CPAN/authors/id/M/MA/MALLEN/Pod-Perldoc-3.23.tar.gz')
md5sums=('86bf97d373c4fc2c85199bce8cc1ce43')
sha512sums=('9b6c6f89dd16f5a953e4891e2c464162d11da848712fcf0a904e9e823b7a7f3ba834c1a0db5b1f72dcfe95e2e9b9055359b6494de0a8138252aa07fe0b4a30d0')
_distdir="Pod-Perldoc-3.23"

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
