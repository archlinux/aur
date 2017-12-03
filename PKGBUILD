# CPAN Name  : String::Print
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-string-print
pkgver=0.92
pkgrel=1
pkgdesc='Perl package providing printf() alternative'
arch=('any')
url='https://metacpan.org/release/String-Print'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1'
	'perl-html-parser'
	'perl-timedate>=2.30'
	'perl-unicode-linebreak')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/String-Print-0.92.tar.gz)
options=(!emptydirs)
md5sums=('665d6dc656e81c933dd1040832969de2')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd String-Print-0.92
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd String-Print-0.92
	sanitize
	make test
}

package() {
	cd String-Print-0.92
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
