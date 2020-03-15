# CPAN Name  : XML::Compile::Cache
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-xml-compile-cache
pkgver=1.06
pkgrel=2
pkgdesc='Perl package providing cache for compiled XML translators'
arch=('any')
url='https://metacpan.org/release/XML-Compile-Cache'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-compile>=1.60'
	'perl-xml-compile-tester>=0.02'
	'perl-xml-libxml-simple>=0.95'
	'perl-log-report>=1.26')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-Cache-1.06.tar.gz)
options=(!emptydirs)
md5sums=('7cc288c91da5c55acfebf5bba472d8a7')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd XML-Compile-Cache-1.06
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-Cache-1.06
	sanitize
	make test
}

package() {
	cd XML-Compile-Cache-1.06
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
