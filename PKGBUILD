# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=JGATCOMB
_perlmod=Tie-Hash-Sorted
pkgname=perl-tie-hash-sorted
pkgver=0.10
pkgrel=1
pkgdesc="Presents hashes in sorted order"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(https://cpan.perl.org/modules/by-authors/id/J/JG/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('56dbe4aebd74937096acc963ef5c3872')

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
