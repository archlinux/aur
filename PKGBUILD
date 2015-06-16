# Contributor: Cilyan Olowen <gaknar@gmail.com>

_pkgname=xls2csv
pkgname=perl-xls2csv
pkgver=1.07
pkgrel=1
pkgdesc="script that recodes a spreadsheet's charset and saves as CSV"
arch=('any')
url="http://search.cpan.org/~ken/xls2csv/script/xls2csv"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-spreadsheet-parseexcel' 'perl-unicode-map' 'perl-text-csv-xs' 'perl-libintl-perl')
source=(http://search.cpan.org/CPAN/authors/id/K/KE/KEN/$_pkgname-$pkgver.tar.gz)
md5sums=('62d5d6370e46dd4ec32163c9d24cc5a8')
sha256sums=('630adf5d6bb2c798f0ca60d0758eccffa57a50d2ca8fd839567feff2b0defe6a')


build() {
  cd "${srcdir}/xls2csv-${pkgver}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/xls2csv-${pkgver}"
  make install DESTDIR="${pkgdir}/"

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
