# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=REHSACK
_perlmod=SQL-Statement
pkgname=perl-sql-statement
pkgver=1.33
pkgrel=1
pkgdesc="SQL parsing and processing engine"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-clone' 'perl-params-util' 'perl-data-dumper') 
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/R/RE/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('7c81e480630f60363fadb82f52095f3a')

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
