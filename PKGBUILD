# CPAN Name  : String::Koremutake
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.13

pkgname=perl-string-koremutake
pkgver=0.30
pkgrel=1
pkgdesc="Perl module that converts to and from Koremutake Memorable Random Strings"
arch=("any")
url="http://search.cpan.org/dist/String-Koremutake"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-error>=0.15")
checkdepends=("perl-test-exception>=0.15")
source=(http://search.cpan.org/CPAN/authors/id/L/LB/LBROCARD/String-Koremutake-0.30.tar.gz)
options=(!emptydirs)
md5sums=("9b28d2017b98015f5e1b376324673419")

build() {
  cd "$srcdir/String-Koremutake-0.30"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/String-Koremutake-0.30"
  make test
}

package() {
  cd "$srcdir/String-Koremutake-0.30"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
