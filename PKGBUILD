# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=REHSACK
_perlmod=SQL-Statement
pkgname=perl-sql-statement
pkgver=1.412
pkgrel=1
pkgdesc="SQL parsing and processing engine"
arch=('any')
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0'
  'perl-clone>=0.30'
  'perl-params-util>=1.00'
)
options=(!emptydirs)
source=(http://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('aa3653325bb627e32021240ff0af3b05')

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
