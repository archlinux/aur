# CPAN Name  : String::Print
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-string-print
pkgver=0.15
pkgrel=1
pkgdesc='Perl package providing printf() alternative'
arch=('any')
url='http://search.cpan.org/dist/String-Print'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-unicode-linebreak')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/String-Print-0.15.tar.gz)
options=(!emptydirs)
md5sums=('469f5a0517a6820abe52f7e23dc9e58b')

build() {
	cd String-Print-0.15
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd String-Print-0.15
	make test
}

package() {
	cd String-Print-0.15
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
