# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
_author=GFUJI
_perlmod=MouseX-Getopt
pkgname=perl-mousex-getopt
pkgver=0.37
pkgrel=1
pkgdesc="Organize your Mouse types in libraries"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-module-build-tiny')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/G/GF/${_author}/${_perlmod}-${pkgver}.tar.gz)
md5sums=('080b1895635b525f2b9792a672b2569e')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor
  ./Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  ./Build install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
