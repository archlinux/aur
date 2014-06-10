# CPAN Name  : XML::Compile::WSDL11
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-xml-compile-wsdl11
pkgver=3.02
pkgrel=1
pkgdesc='Perl package to create SOAP messages defined by WSDL 1.1'
arch=('any')
url='http://search.cpan.org/dist/XML-Compile-WSDL11'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-compile>=1.37'
	'perl-xml-compile-cache>=0.995'
	'perl-xml-compile-soap>=3.03'
	'perl-log-report>=1.00')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-WSDL11-3.02.tar.gz)
options=(!emptydirs)
md5sums=('86fee8a5ae14392c1c3efb87f4e1620b')

build() {
	cd XML-Compile-WSDL11-3.02
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-WSDL11-3.02
	make test
}

package() {
	cd XML-Compile-WSDL11-3.02
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
