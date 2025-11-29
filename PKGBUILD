# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbd-csv'
pkgver='0.62'
pkgrel='1'
pkgdesc="DBI driver for CSV files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi' 'perl-sql-statement>=1.405' 'perl-text-csv-xs>=1.01' 'perl>=5.8.1')
makedepends=('perl-dbi>=1.628')
url='https://metacpan.org/release/DBD-CSV'
source=('http://search.cpan.org/CPAN/authors/id/H/HM/HMBRAND/DBD-CSV-0.62.tgz')
md5sums=('3d03d2540028eaece5a7e3594903e5e4')
sha512sums=('088b182c502725ea63ed5d7d618560bbdb58ce4dd37e5b536c9ba88b4b5c5ee79f20026512950a009b6d82f0db83a870588af2ab63d46bf9cfa88094133b4239')
_distdir="DBD-CSV-0.62"

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
