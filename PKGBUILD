# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-list-permutor
pkgver=0.022
pkgrel=1
pkgdesc="Perl module to process all possible permutations of a list"
arch=("i686" "x86_64")
url="http://search.cpan.org/dist/List-Permutor/"
license=("unknown")
depends=("perl")

options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/P/PH/PHOENIX/List-Permutor-$pkgver.tar.gz)
md5sums=("b5c0f922730b9493c7c1e0583a5c8f78")

build() {
  cd "$srcdir/List-Permutor-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/List-Permutor-$pkgver"
  make test
}

package() {
  cd "$srcdir/List-Permutor-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
