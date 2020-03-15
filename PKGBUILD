# CPAN Name  : XML::Compile::Tester
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-xml-compile-tester
pkgver=0.91
pkgrel=2
pkgdesc='Perl package that supports XML::Compile-related regression testing'
arch=('any')
url='https://metacpan.org/release/XML-Compile-Tester'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-log-report>=0.17')
checkdepends=('perl-test-deep>=0.095')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-Tester-0.91.tar.gz)
options=(!emptydirs)
md5sums=('6a82e35ebb9e7191305594b1737ee3be')

build() {
	cd XML-Compile-Tester-0.91
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-Tester-0.91
	make test
}

package() {
	cd XML-Compile-Tester-0.91
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
