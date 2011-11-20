# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=HMBRAND
_perlmod=DBD-CSV
pkgname=perl-dbd-csv
pkgver=0.33
pkgrel=1
pkgdesc="DBI driver for CSV files"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-text-csv-xs' 'perl-dbi' )
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/H/HM/$_author/$_perlmod-$pkgver.tgz)
md5sums=('0b43201bf1aa043e12bebecdec17a17e')

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
