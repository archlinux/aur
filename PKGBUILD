# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=HMBRAND
_perlmod=DBD-CSV
pkgname=perl-dbd-csv
pkgver=0.38
pkgrel=1
pkgdesc="DBI driver for CSV files"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0'
  'perl-dbi>=1.623'
  'perl-text-csv-xs>=0.94'
  'perl-sql-statement>=1.402'
)
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/H/HM/$_author/$_perlmod-$pkgver.tgz)
md5sums=('6f2e0048d3afc60a3207af8ca8d8fdc5')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:
