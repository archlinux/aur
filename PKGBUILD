# Maintainer: dracorp aka Piotr Rogoza <piotr dot r dot public at gmail.com>

_author=N/NE/NEILB
_perlmod=Sort-Versions
pkgname=perl-sort-versions
pkgver=1.62
pkgrel=1
pkgdesc='Sort::Versions - a perl 5 module for sorting of revision-like numbers'
arch=('any')
url="http://search.cpan.org/dist/Sort-Versions/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha512sums=('b30dab96a5a31023af3ecee1857ae7bf5abc45b266294b47abb4f03c332b27825c1139d1a56bf0cfbd538487d28b3be167d83f9f5a93f079717b40157abe4d96')
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1
build(){
  cd "$srcdir/$_perlmod-$pkgver"
  /usr/bin/perl Makefile.PL
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
