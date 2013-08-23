# CPAN Name  : Test::FailWarnings
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-test-failwarnings
pkgver=0.005
pkgrel=1
pkgdesc='A Perl package that add test failures if warnings are caught'
arch=('any')
url='http://search.cpan.org/dist/Test-FailWarnings'
license=('Apache')
depends=('perl>=5.10.1')
checkdepends=('perl-capture-tiny')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Test-FailWarnings-0.005.tar.gz)
options=(!emptydirs)
md5sums=('b73257948f9b656487216f3a95812d32')

build() {
  cd "$srcdir/Test-FailWarnings-0.005"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Test-FailWarnings-0.005"
  make test
}

package() {
  cd "$srcdir/Test-FailWarnings-0.005"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
