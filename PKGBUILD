_author=typiconman
_perlmod=Lingua-Cu
pkgname=perl-lingua-cu
pkgver=980ffb3
pkgrel=1
pkgdesc="Perl Module Lingua::Cu"
arch=('any')
url="https://github.com/$_author/Perl-$_perlmod"
license=('GPL' 'PerlArtistic')
makedepends=('git')
depends=('perl' 'perl-tie-ixhash' 'perl-unicode-collate')
optdepends=('perl-unicode-normalize')
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

