# CPAN Name  : Class::InsideOut
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-class-insideout
pkgver=1.13
pkgrel=1
pkgdesc='Perl module for safe and simple inside-out objects construction'
arch=('any')
url="http://search.cpan.org/dist/Class-InsideOut"
license=('Apache')
depends=("perl" "perl-class-isa")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Class-InsideOut-1.13.tar.gz)
md5sums=('5b760b74a7c36cd7a5a1f3aa614318da')

build() {
  cd "$srcdir/Class-InsideOut-1.13"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Class-InsideOut-1.13"
  make test
}

package() {
  cd "$srcdir/Class-InsideOut-1.13"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
