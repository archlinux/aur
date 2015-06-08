# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor:
_author=mattlaw
_authorUP=MATTLAW
_perlmod=File-BOM
pkgname=perl-file-bom
pkgver=0.14
pkgrel=1
pkgdesc='Utilities for handling Byte Order Marks'
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/lib/File/BOM.pm"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/M/MA/$_authorUP/$_perlmod-$pkgver.tar.gz")
md5sums=('e55642294d8ab369b4dda4e9d57c8e41')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

  ## For packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  ## For packages with Build.PL, do this instead:
  # perl Build install
}

# vim:set ts=2 sw=2 et:
