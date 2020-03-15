# CPAN Name  : Log::Report
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-log-report
pkgver=1.29
pkgrel=2
pkgdesc='Perl package to log/report a problem with exceptions, pluggable handlers and translation support'
arch=('any')
url='https://metacpan.org/release/Log-Report'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-devel-globaldestruction>=0.09' 'perl-log-report-optional>=1.03' 'perl-string-print>=0.91')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/Log-Report-1.29.tar.gz)
options=(!emptydirs)
md5sums=('087c225f8b85e3d0edbf9e688a57f8b6')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Log-Report-1.29
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Log-Report-1.29
	sanitize
	make test
}

package() {
	cd Log-Report-1.29
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
