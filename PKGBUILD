# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
_author=REHSACK
_perlmod=SQL-Statement
pkgname=perl-sql-statement
pkgver=1.412
pkgrel=2
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
sha256sums=('65c870883379c11b53f19ead10aaac241ccc86a90bbab77f6376fe750720e5c8')

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
