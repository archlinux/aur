# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
_author=SREZIC
_perlmod=Kwalify
pkgname=perl-kwalify
pkgver=1.23
pkgrel=1
pkgdesc="Kwalify schema for data structures"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(https://cpan.perl.org/modules/by-authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('32a9791b25295e2590c316c64fd9d891')

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
