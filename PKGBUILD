# CPAN Name  : Class::InsideOut
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-class-insideout
pkgver=1.14
pkgrel=1
pkgdesc='Perl module for safe and simple inside-out objects construction'
arch=('any')
url="https://metacpan.org/release/Class-InsideOut"
license=('Apache')
depends=("perl" "perl-class-isa")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Class-InsideOut-1.14.tar.gz)
md5sums=('cf9fe58eec6f61c6e483c75479e4a367')

build() {
  cd "$srcdir/Class-InsideOut-1.14"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Class-InsideOut-1.14"
  make test
}

package() {
  cd "$srcdir/Class-InsideOut-1.14"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
