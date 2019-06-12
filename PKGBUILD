# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
_author=HMBRAND
_perlmod=DBD-CSV
pkgname=perl-dbd-csv
pkgver=0.54
pkgrel=2
pkgdesc="DBI driver for CSV files"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0'
  'perl-dbi>=1.628'
  'perl-text-csv-xs>=1.01'
  'perl-sql-statement>=1.405'
)
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/H/HM/$_author/$_perlmod-$pkgver.tgz)
sha256sums=('bc597cd7195e5a023e2b3413d8dc614602b9b3f279f436027881796464d4f0be')

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
