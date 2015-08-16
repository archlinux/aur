# CPAN Name  : XML::Compile::Cache
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-xml-compile-cache
pkgver=1.03
pkgrel=1
pkgdesc='Perl package providing cache for compiled XML translators'
arch=('any')
url='https://metacpan.org/release/XML-Compile-Cache'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-compile>=1.48'
	'perl-xml-compile-tester>=0.02'
	'perl-xml-libxml-simple>=0.95'
	'perl-log-report>=0.19')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-Cache-1.03.tar.gz)
options=(!emptydirs)
md5sums=('57e99c0434e1220eaf8fa1ce095ec008')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd XML-Compile-Cache-1.03
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-Cache-1.03
	sanitize
	make test
}

package() {
	cd XML-Compile-Cache-1.03
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
