# Contributor: camb
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dancer-plugin-database-core'
pkgver='0.13'
pkgrel='1'
pkgdesc="Shared core for D1 and D2 Database plugins"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Dancer-Plugin-Database-Core'
source=('http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/Dancer-Plugin-Database-Core-0.13.tar.gz')
md5sums=('ce0c24ec31ba30c037dfde315c306e41')
sha512sums=('6e43e02e269e18396c05dbe486e73cf8cb81b755b0fa47a1aa4fe7b3f8686ac14a9ee402776839b7c57f49bbd0b196edb1f1998feef1bb110afa8b002abb6ed3')
_distdir="Dancer-Plugin-Database-Core-0.13"

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
