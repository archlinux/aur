# CPAN Name  : Math::Counting
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-math-counting
pkgver=0.1304
pkgrel=1
pkgdesc='Perl module for combinatorial counting operations'
arch=('any')
url="https://metacpan.org/release/Math-Counting"
license=('GPL' 'PerlArtistic')
depends=('perl>5.10.1')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GE/GENE/Math-Counting-0.1304.tar.gz)
md5sums=('ae9e5dba83af6c754d41ab4d1a47f2fb')

build() {
  cd "$srcdir/Math-Counting-0.1304"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Math-Counting-0.1304"
  make test
}

package() {
  cd "$srcdir/Math-Counting-0.1304"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
