# CPAN Name  : Log::Report
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-log-report
pkgver=1.07
pkgrel=1
pkgdesc='Perl package to log/report a problem with exceptions, pluggable handlers and translation support'
arch=('any')
url='https://metacpan.org/release/Log-Report'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-devel-globaldestruction>=0.09' 'perl-log-report-optional>=1.01' 'perl-string-print>=0.13')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/Log-Report-1.07.tar.gz)
options=(!emptydirs)
md5sums=('00f37a702334233f60622c4955ab4c5c')

build() {
	cd Log-Report-1.07
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Log-Report-1.07
	make test
}

package() {
	cd Log-Report-1.07
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
