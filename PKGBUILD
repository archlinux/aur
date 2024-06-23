# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbd-csv'
pkgver='0.60'
pkgrel='1'
pkgdesc="DBI driver for CSV files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=0' 'perl-sql-statement>=1.405' 'perl-text-csv-xs>=1.01' 'perl>=5.8.1')
makedepends=('perl-dbi>=1.628')
url='https://metacpan.org/release/DBD-CSV'
source=('http://search.cpan.org/CPAN/authors/id/H/HM/HMBRAND/DBD-CSV-0.60.tgz')
md5sums=('bd3e3adc710d67b34ad4501791d4c49d')
sha512sums=('d5ccf984022001e6a51301107a807a312885dabae243f0d2418265a1672b4c96b173ebf0cf2b30a194fe115ea026c3e23c97b11c607c8efe3902257d99a00089')
_distdir="DBD-CSV-0.60"

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
