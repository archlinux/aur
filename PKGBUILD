# Maintainer: 4leks4ndr <orthodox dot tk at gmail dot com>

_author=typiconman
_perlmod=Lingua-Cu
pkgname=perl-lingua-cu
pkgver=84bdd02
pkgrel=2
pkgdesc="Perl Module Lingua::Cu"
arch=('any')
url="https://github.com/$_author/Perl-$_perlmod"
license=('GPL' 'PerlArtistic')
makedepends=('git')
depends=('perl' 'perl-tie-ixhash')
options=(!emptydirs)
source=("git+$url.git#commit=$pkgver")
md5sums=('SKIP')

build() {
  cd $srcdir/Perl-$_perlmod
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/Perl-$_perlmod
  make install DESTDIR="$pkgdir/"
}

