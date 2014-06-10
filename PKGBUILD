# CPAN Name  : XML::Compile
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-xml-compile
pkgver=1.44
pkgrel=1
pkgdesc='Perl package providing compilation-based XML processing'
arch=('any')
url='http://search.cpan.org/dist/XML-Compile'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.13.7'
	'perl-xml-libxml>=1.94'
	'perl-xml-compile-tester>=0.90'
	'perl-log-report>=1.03')
checkdepends=('perl-test-deep>=0.095')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-1.44.tar.gz)
options=(!emptydirs)
md5sums=('d6ebcbe23729a61c4ce93bcbc3c06564')

build() {
	cd XML-Compile-1.44
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-1.44
	make test
}

package() {
	cd XML-Compile-1.44
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
