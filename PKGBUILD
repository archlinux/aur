# Maintainer: mutantmonkey <aur@mutantmonkey.in>
_author=chamas
_perlmod=Tie-Cache
pkgname=perl-tie-cache
pkgver=0.19
pkgrel=2
pkgdesc="LRU Cache in memory"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHAMAS/Tie-Cache-$pkgver.tar.gz)
sha256sums=('29065e9327d4d389131242bdd787c46126c5cc0c6656fdbc0454950e4660561b')

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
