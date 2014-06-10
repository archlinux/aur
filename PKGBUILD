# CPAN Name  : XML::Compile::SOAP
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-xml-compile-soap
pkgver=3.05
pkgrel=1
pkgdesc='Perl package for SOAP implementations'
arch=('any')
url='http://search.cpan.org/dist/XML-Compile-SOAP'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-compile>=1.42'
	'perl-xml-compile-tester>=0.90'
	'perl-xml-compile-cache>=0.995'
	'perl-log-report>=1.00'
	'perl-libwww>=5.816'
	'perl-file-slurp-tiny')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-SOAP-3.05.tar.gz)
options=(!emptydirs)
md5sums=('dab0560c40b0e196b424f34ed7caa74f')

build() {
	cd XML-Compile-SOAP-3.05
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-SOAP-3.05
	make test
}

package() {
	cd XML-Compile-SOAP-3.05
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
