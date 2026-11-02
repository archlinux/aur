# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-search-trigram'
pkgver='0.03'
pkgrel='1'
pkgdesc="Trigram inverted index search with Dice coefficient scoring"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Search-Trigram'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Search-Trigram-$pkgver.tar.gz")
md5sums=('59acb629f8d901e09cff1bc072fa0048')
sha512sums=('653c66ec2445cae4975146eaae1a810411b20bbdc9c19e56b36566165bb299969dbc0e6cfedd34cad4b44c887913300a6f5a6d8f447e876f9f273d8f50eb0994')
_distdir="Search-Trigram-$pkgver"

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
