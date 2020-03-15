# CPAN Name  : Math::Counting
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-math-counting
pkgver=0.1307
pkgrel=2
pkgdesc='Perl module for combinatorial counting operations'
arch=('any')
url="https://metacpan.org/release/Math-Counting"
license=('GPL' 'PerlArtistic')
depends=('perl>5.10.1')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GE/GENE/Math-Counting-0.1307.tar.gz)
md5sums=('e135814bdccf7a193994ff4ca97aded0')

build() {
  cd "$srcdir/Math-Counting-0.1307"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Math-Counting-0.1307"
  make test
}

package() {
  cd "$srcdir/Math-Counting-0.1307"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
