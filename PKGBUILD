# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

_perlmod=Data-Perl
pkgname=perl-data-perl
pkgver=0.002009
pkgrel=1
pkgdesc="Data::Perl - Base classes wrapping fundamental Perl data types"
arch=('any')
url="http://search.cpan.org/~mattp/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl' 'perl-role-tiny' 'perl-list-moreutils')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MATTP/$_perlmod-$pkgver.tar.gz)
sha256sums=('b62b2225870c2c3b16fb78c429f8729ddb8ed0e342f4209ec3c261b764c36f8b')

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
