# CPAN Name  : Log::Report::Optional
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-log-report-optional
pkgver=1.06
pkgrel=2
pkgdesc='Perl package providing Log::Report or ::Minimal'
arch=('any')
url='https://metacpan.org/release/Log-Report-Optional'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-string-print>=0.91')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/Log-Report-Optional-1.06.tar.gz)
options=(!emptydirs)
md5sums=('0f85776a1b069311a24b6551996920c7')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Log-Report-Optional-1.06
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Log-Report-Optional-1.06
	sanitize
	make test
}

package() {
	cd Log-Report-Optional-1.06
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
