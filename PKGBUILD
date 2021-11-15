# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
_author=REHSACK
_perlmod=SQL-Statement
pkgname=perl-sql-statement
pkgver=1.414
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
source=(https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('dde8bdcfa6a136eedda06519ba0f3efaec085c39db0df9c472dc0ec6cd781a49')

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
