# CPAN Name  : Test::Class
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-test-class
pkgver=0.39
pkgrel=1
pkgdesc='Perl module to easily create test classes in an xUnit/JUnit style'
arch=('any')
url='http://search.cpan.org/dist/Test-Class'
license=('GPL')
options=(!emptydirs)
depends=('perl>=5.8.9' 'perl-attribute-handlers>=0.77' 'perl-test-simple'
	'perl-mro-compat>=0.11')
makedepends=('perl-extutils-pkgconfig')
checkdepends=('perl-test-exception' 'perl-test-most')
source=(http://search.cpan.org/CPAN/authors/id/A/AD/ADIE/Test-Class-0.39.tar.gz)
md5sums=('f296e57ede695bff76e4f1336e4c49d3')

build() {
  cd "$srcdir/Test-Class-0.39"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Test-Class-0.39"
  make test
}

package() {
  cd "$srcdir/Test-Class-0.39"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
