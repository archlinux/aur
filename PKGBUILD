# Contributor: camb
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dancer-plugin-database-core'
pkgver='0.20'
pkgrel='1'
pkgdesc="Shared core for D1 and D2 Database plugins"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=0' 'perl>=5.6')
makedepends=()
url='https://metacpan.org/release/Dancer-Plugin-Database-Core'
source=("http://search.cpan.org/CPAN/authors/id/B/BI/BIGPRESH/Dancer-Plugin-Database-Core-${pkgver}.tar.gz")
md5sums=('05c72a7567bd5f63cd84980c20d55416')
sha512sums=('647334b7b457b214d229100848f5434e885dc73b669d256d7fc49ee1ca82be8670064e57cf8df8c6127389e6191fd63b50cd387bd97847a6cc55d313e7ecf15f')
_distdir="Dancer-Plugin-Database-Core-${pkgver}"

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
