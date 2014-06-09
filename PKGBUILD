# CPAN Name  : Log::Report::Optional
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-log-report-optional
pkgver=1.01
pkgrel=1
pkgdesc='Perl package providing Log::Report or ::Minimal'
arch=('any')
url='http://search.cpan.org/dist/Log-Report-Optional'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1' 'perl-string-print>=0.13')
source=(http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/Log-Report-Optional-1.01.tar.gz)
options=(!emptydirs)
md5sums=('fb379bb1f84c2fa1dee5ea8998fe2426')

build() {
	cd Log-Report-Optional-1.01
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Log-Report-Optional-1.01
	make test
}

package() {
	cd Log-Report-Optional-1.01
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
