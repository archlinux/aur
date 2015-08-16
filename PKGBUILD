# CPAN Name  : XML::Compile::SOAP12
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-xml-compile-soap12
pkgver=3.03
pkgrel=1
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
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-SOAP12-3.03.tar.gz)
options=(!emptydirs)
md5sums=('ec095c530d146104be7e20220414ec85')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd XML-Compile-SOAP12-3.03
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-SOAP12-3.03
	sanitize
	make test
}

package() {
	cd XML-Compile-SOAP12-3.03
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
