# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

_perlmod=MooX-late
pkgname=perl-moox-late
pkgver=0.015
pkgrel=2
pkgdesc="MooX::late - easily translate Moose code to Moo"
arch=('any')
url="http://search.cpan.org/~tobyink/MooX-late/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl' 'perl-moo' 'perl-test-requires' 'perl-test-fatal' 'perl-type-tiny')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_perlmod-$pkgver.tar.gz)
sha256sums=('175326af3076fa8698669f289fad1322724978cddaf40ea04e600fcd7f6afbbf')

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
