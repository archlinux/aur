# CPAN Name  : XML::Compile::SOAP12
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-xml-compile-soap12
pkgver=3.02
pkgrel=1
pkgdesc='Perl package that handles SOAP v1.2 protocol'
arch=('any')
url='http://search.cpan.org/dist/XML-Compile-SOAP12'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-compile>=1.40'
	'perl-xml-compile-tester>=0.05'
	'perl-xml-compile-cache>=0.995'
	'perl-xml-compile-soap>=3.04')
checkdepends=('perl-test-deep>=0.095')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-SOAP12-3.02.tar.gz)
options=(!emptydirs)
md5sums=('0a5b398bb35541152e324b4e7b4063f1')

build() {
	cd XML-Compile-SOAP12-3.02
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-SOAP12-3.02
	make test
}

package() {
	cd XML-Compile-SOAP12-3.02
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
