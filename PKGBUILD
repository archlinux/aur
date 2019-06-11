# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
_author=chamas
_perlmod=Tie-Cache
pkgname=perl-tie-cache
pkgver=0.21
pkgrel=3
pkgdesc="LRU Cache in memory"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/C/CH/CHAMAS/${_perlmod}-${pkgver}.tar.gz)
md5sums=('8210f295e8676c8540a5934f88bf5fed')

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
