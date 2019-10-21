# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-refcount'
pkgver='0.10'
pkgrel='1'
pkgdesc="obtain the REFCNT value of a referent"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/Devel-Refcount'
source=('https://cpan.metacpan.org/authors/id/P/PE/PEVANS/Devel-Refcount-0.10.tar.gz')
md5sums=('06a77b7d16b6fc504580929b11029fbf')
sha512sums=('5020df05fa8f49ac98a19b5795ee6caed20c44e6dab2cca80e2a2f6e30a5384f196175b53093d14c78b6a66555d80042540e19461b10c7dce46fa6a8f7190767')
_distdir="Devel-Refcount-0.10"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
