# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=SALVA
_perlmod=Config-Properties
pkgname=perl-config-properties
pkgver=1.80
pkgrel=1
pkgdesc="A near implementation of the java.util.Properties API."
arch=(any)
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('d3aa9eebbbb2c751d5b3441616d8eb56')

build() {
  cd "$srcdir/Config-Properties-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

check() {
  cd "$srcdir/Config-Properties-$pkgver"
  make test
}

package() {
  cd "$srcdir/Config-Properties-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:
