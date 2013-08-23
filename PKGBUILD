# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-set-intersection
pkgver=0.02
pkgrel=1
pkgdesc="Perl package to get intersection (of set theory) of ARRAYs."
arch=("any")
url="http://search.cpan.org/dist/Set-Intersection/"
license=("GPL" "PerlArtistic")
depends=("perl")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/T/TU/TURUGINA/Set-Intersection-$pkgver.tar.gz)
md5sums=("d373ed67980d1495b8c6f7ea73cc9985")

build() {
  cd "$srcdir/Set-Intersection-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Set-Intersection-$pkgver"
  make test
}

package() {
  cd "$srcdir/Set-Intersection-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
