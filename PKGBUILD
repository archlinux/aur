# CPAN Name  : XML::Compile::WSDL11
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-xml-compile-wsdl11
pkgver=3.07
pkgrel=3
pkgdesc='Perl package to create SOAP messages defined by WSDL 1.1'
arch=('any')
url='https://metacpan.org/release/XML-Compile-WSDL11'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-compile>=1.48'
	'perl-xml-compile-cache>=1.03'
	'perl-xml-compile-soap>=3.23'
	'perl-log-report>=1.05')
checkdepends=('perl-test-deep')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-WSDL11-3.07.tar.gz)
options=(!emptydirs)
md5sums=('2866c7ef1630b76182deaae36879b9f8')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd XML-Compile-WSDL11-3.07
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-WSDL11-3.07
	sanitize
	make test
}

package() {
	cd XML-Compile-WSDL11-3.07
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
