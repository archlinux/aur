# CPAN Name  : XML::Compile::C14N
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-xml-compile-c14n
pkgver=0.95
pkgrel=2
pkgdesc='Perl package for XML canonicalization'
arch=('any')
url='https://metacpan.org/release/XML-Compile-C14N'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-xml-libxml>=1.94'
	'perl-xml-compile>=1.30'
	'perl-xml-compile-cache>=0.995'
	'perl-log-report>=1.10')
checkdepends=('perl>=5.13.11')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/XML-Compile-C14N-0.95.tar.gz)
options=(!emptydirs)
md5sums=('98e193ffdb67c525bee084e778856db9')

build() {
	cd XML-Compile-C14N-0.95
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd XML-Compile-C14N-0.95
	make test
}

package() {
	cd XML-Compile-C14N-0.95
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
