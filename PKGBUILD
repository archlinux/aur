# Maintainer: mutantmonkey <aur@mutantmonkey.in>
_author=GFUJI
_perlmod=MouseX-Types
pkgname=perl-mousex-types
pkgver=0.06
pkgrel=1
pkgdesc="Organize your Mouse types in libraries"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GF/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('77288441fdadd15beeec9a0813ece8aec1542f1d8ceaaec14755b3f316fbcf8b')

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
