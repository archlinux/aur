# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

_perlmod=MooX-HandlesVia
pkgname=perl-moox-handlesvia
pkgver=0.001008
pkgrel=2
pkgdesc="MooX::HandlesVia - NativeTrait-like behavior for Moo"
arch=('any')
url="http://search.cpan.org/~mattp/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl' 'perl-moo' 'perl-moox-types-mooselike' 'perl-strictures' 'perl-data-perl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MATTP/$_perlmod-$pkgver.tar.gz)
sha256sums=('b0946f23b3537763b8a96b8a83afcdaa64fce4b45235e98064845729acccfe8c')

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
