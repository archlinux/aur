# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
_author=HMBRAND
_perlmod=DBD-CSV
pkgname=perl-dbd-csv
pkgver=0.58
pkgrel=1
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
source=(https://cpan.perl.org/modules/by-authors/id/H/HM/$_author/$_perlmod-$pkgver.tgz)
sha256sums=('6c26f710453b14d7b3cf5f3e1697e8ddaa48c0a66f5d811f4394bd8c32f287ef')

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
