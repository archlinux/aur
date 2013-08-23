# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-object-declare
pkgver=0.22
pkgrel=1
pkgdesc="Perl module providing a declarative object constructor"
arch=("any")
url="http://search.cpan.org/dist/Object-Declare/"
license=("MIT")
depends=("perl" "perl-sub-override")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/A/AU/AUDREYT/Object-Declare-0.22.tar.gz)
md5sums=("9607cd7b485bd7e01c3286f1dd8df187")

build() {
  cd "$srcdir/Object-Declare-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Object-Declare-$pkgver"
  make test
}

package() {
  cd "$srcdir/Object-Declare-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
