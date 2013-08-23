# CPAN Name  : Math::Counting
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-math-counting
pkgver=0.1303
pkgrel=1
pkgdesc='Perl module for combinatorial counting operations'
arch=('any')
url="http://search.cpan.org/dist/Math-Counting"
license=('GPL' 'PerlArtistic')
depends=('perl>5.10.1')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GE/GENE/Math-Counting-0.1303.tar.gz)
md5sums=('108316c63bddff9b85345b4789142cc2')

build() {
  cd "$srcdir/Math-Counting-0.1303"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Math-Counting-0.1303"
  make test
}

package() {
  cd "$srcdir/Math-Counting-0.1303"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
