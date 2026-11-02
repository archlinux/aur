# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-loop'
pkgver='0.09'
pkgrel='1'
pkgdesc="non-blocking DBI on your event loop"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-dbd-sqlite>=0' 'perl-dbi>=1.600' 'perl-io-async>=0' 'perl>=5.8.3')
makedepends=()
url='https://metacpan.org/release/DBIx-Loop'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/DBIx-Loop-$pkgver.tar.gz")
md5sums=('ac9ce8f684fcc298255f46b04ac9c636')
sha512sums=('ea2534d850df7767f413f5d9133cc94f06cf92e7a3baed9b297a4f0ee30c33263943b9b1ec1f2bc462446002d4adf4da18dfd7dfc55f7bb9b7437cd44263dca5')
_distdir="DBIx-Loop-$pkgver"

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
