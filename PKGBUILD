# CPAN Name  : XML::Compile::Cache
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-xml-compile-cache
pkgver=1.02
pkgrel=1
pkgdesc='Perl package providing cache for compiled XML translators'
arch=('any')
url='http://search.cpan.org/dist/XML-Compile-Cache'
license=('PerlArtistic' 'GPL')
depends=('perl-xml-compile>=1.41' 'perl-xml-compile-tester>=0.02' 'perl-xml-libxml-simple>=0.13' 'perl-log-report>=0.19')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-Cache-1.02.tar.gz)
options=(!emptydirs)
md5sums=('a72a4b5e726c51d8060438baf70e815d')

build() {
	cd XML-Compile-Cache-1.02
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-Cache-1.02
	make test
}

package() {
	cd XML-Compile-Cache-1.02
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
