# CPAN Name  : Test::FailWarnings
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-test-failwarnings
pkgver=0.007
pkgrel=1
pkgdesc='A Perl package that add test failures if warnings are caught'
arch=('any')
url='http://search.cpan.org/dist/Test-FailWarnings'
license=('Apache')
depends=('perl>=5.10.1')
checkdepends=('perl>=5.13.4' 'perl-capture-tiny>=0.12')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Test-FailWarnings-0.007.tar.gz)
options=(!emptydirs)
md5sums=('e81bafafa5ecb9455b970f99b726da7c')

build() {
  cd Test-FailWarnings-0.007
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Test-FailWarnings-0.007
  make test
}

package() {
  cd Test-FailWarnings-0.007
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
