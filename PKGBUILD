# CPAN Name  : Log::Report::Optional
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-log-report-optional
pkgver=1.07
pkgrel=1
pkgdesc='Perl package providing Log::Report or ::Minimal'
arch=('any')
url='https://metacpan.org/release/Log-Report-Optional'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-string-print>=0.91')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/Log-Report-Optional-1.07.tar.gz)
options=(!emptydirs)
md5sums=('790e56d70210626223f0ba2ce8f8ee1c')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Log-Report-Optional-1.07
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Log-Report-Optional-1.07
	sanitize
	make test
}

package() {
	cd Log-Report-Optional-1.07
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
