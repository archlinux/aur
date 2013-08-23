# CPAN Name  : Devel::Pragma
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname=perl-devel-pragma
pkgver=0.54
pkgrel=1
pkgdesc="Perl module providing helper functions for developers of lexical pragmas"
arch=("any")
url="http://search.cpan.org/dist/Devel-Pragma"
license=("PerlArtistic" "GPL")
depends=("perl" "perl-extutils-depends>=0.302" "perl-b-hooks-endofscope>=0.09" "perl-b-hooks-op-annotation>=0.43" "perl-b-hooks-op-check>=0.18")
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHOCOLATE/Devel-Pragma-0.54.tar.gz)
options=(!emptydirs)
md5sums=("6f68dd87e2433f8640dea58be3e3e97d")

build() {
  cd "$srcdir/Devel-Pragma-0.54"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Devel-Pragma-0.54"
  make test
}

package() {
  cd "$srcdir/Devel-Pragma-0.54"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
