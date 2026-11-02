# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-frozen'
pkgver='0.09'
pkgrel='1'
pkgdesc="an immutable container that survives a fork"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Frozen'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Frozen-$pkgver.tar.gz")
md5sums=('2cf5f05f68735fdfdd720ac0daa48e2a')
sha512sums=('e22645a20dbdb5205f8bc40694cead7b9b19ba55d4510ca93539b1b10a3466ec7eaa66c01997a6d3867958e67d89ee08ad081da773eddd9c37308c275ad43af3')
_distdir="Frozen-$pkgver"

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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
