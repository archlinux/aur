# CPAN Name  : XML::Compile::Tester
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-xml-compile-tester
pkgver=0.90
pkgrel=1
pkgdesc='Perl package that supports XML::Compile-related regression testing'
arch=('any')
url='http://search.cpan.org/dist/XML-Compile-Tester'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-log-report>=0.17')
checkdepends=('perl-test-deep>=0.095')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-Tester-0.90.tar.gz)
options=(!emptydirs)
md5sums=('f228165ab2ce016389f1d2accb6ddf29')

build() {
	cd XML-Compile-Tester-0.90
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-Tester-0.90
	make test
}

package() {
	cd XML-Compile-Tester-0.90
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
