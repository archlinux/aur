# CPAN Name  : ExtUtils::F77
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.15

pkgname=perl-extutils-f77
pkgver=1.17
pkgrel=1
pkgdesc="Perl module providing simple interface to F77 libraries"
arch=("any")
url="http://search.cpan.org/dist/ExtUtils-F77"
license=("PerlArtistic" "GPL")
depends=("perl" "gcc-fortran")
source=(http://search.cpan.org/CPAN/authors/id/K/KG/KGB/ExtUtils-F77-1.17.tar.gz)
options=(!emptydirs)
md5sums=("c0143b5342587ed2ee5db3f6cfb9cc13")

build() {
  cd "$srcdir/ExtUtils-F77-1.17"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/ExtUtils-F77-1.17"
  make test
}

package() {
  cd "$srcdir/ExtUtils-F77-1.17"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
