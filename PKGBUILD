# CPAN Name  : XML::Compile::SOAP12
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-xml-compile-soap12
pkgver=3.06
pkgrel=2
pkgdesc='Perl package that handles SOAP v1.2 protocol'
arch=('any')
url='https://metacpan.org/release/XML-Compile-SOAP12'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-compile>=1.40'
	'perl-xml-compile-tester>=0.05'
	'perl-xml-compile-cache>=0.995'
	'perl-xml-compile-soap>=3.08')
checkdepends=('perl-test-deep>=0.095')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-SOAP12-3.06.tar.gz)
options=(!emptydirs)
md5sums=('6f00f6a487aad485126c7ab0d7c26db9')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd XML-Compile-SOAP12-3.06
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-SOAP12-3.06
	sanitize
	make test
}

package() {
	cd XML-Compile-SOAP12-3.06
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
