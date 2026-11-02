# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-open-api'
pkgver='0.15'
pkgrel='1'
pkgdesc="OpenAPI 2.0, 3.0 and 3.1 server and client"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-file-raw-json>=0.07' 'perl-json-schema-fast>=0.09' 'perl>=5.8.3')
makedepends=()
url='https://metacpan.org/release/Open-API'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Open-API-$pkgver.tar.gz")
md5sums=('ce8c1666069d2533fe002409c582d3d2')
sha512sums=('fc7884e3e91c2eae61242a9740efa2f2b9f2f9dca508e76fe27dca60f81ee21da8105484fe19e7e2d297ebcce7d0015f1281605ee3dbea0817083d8ca0f582d4')
_distdir="Open-API-$pkgver"

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
