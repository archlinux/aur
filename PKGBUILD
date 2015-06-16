# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-business-ismn'
pkgver='1.13'
pkgrel='1'
pkgdesc="work with International Standard Music Numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-tie-cycle>=1.21')
makedepends=()
url='http://search.mcpan.org/dist/Business-ISMN'
source=('http://search.mcpan.org/CPAN/authors/id/B/BD/BDFOY/Business-ISMN-1.13.tar.gz')
md5sums=('e8696a78b4aa8a99869fbb0625c5cc13')
sha512sums=('bad9fdfe16a6b62c823019af4162e0cb2f97dbda8cc5cad01ff3a6e80d22e5fa1d260ef410ad1393d03fc750f7976f06932ac948390cdeb995cc458e1d3cd984')
_distdir="Business-ISMN-1.13"

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
