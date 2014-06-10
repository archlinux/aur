# CPAN Name  : XML::Compile::C14N
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-xml-compile-c14n
pkgver=0.94
pkgrel=1
pkgdesc='Perl package for XML canonicalization'
arch=('any')
url='http://search.cpan.org/dist/XML-Compile-C14N'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-libxml>=1.94'
	'perl-xml-compile>=1.30'
	'perl-xml-compile-cache>=0.995'
	'perl-log-report>=0.991')
checkdepends=('perl>=5.13.11')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-C14N-0.94.tar.gz)
options=(!emptydirs)
md5sums=('b98e76215074866a2058414432188cc9')

build() {
	cd XML-Compile-C14N-0.94
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-C14N-0.94
	make test
}

package() {
	cd XML-Compile-C14N-0.94
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
