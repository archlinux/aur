# CPAN Name  : Business::ISBN::Data
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-business-isbn-data
pkgver=20140910.002
pkgrel=1
pkgdesc='Data pack for Business::ISBN'
arch=('any')
url='http://search.cpan.org/dist/Business-ISBN-Data'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Business-ISBN-Data-20140910.002.tar.gz)
options=(!emptydirs)
md5sums=('448104360420c530fbd88ad125a6be54')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Business-ISBN-Data-20140910.002
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Business-ISBN-Data-20140910.002
	sanitize
	make test
}

package() {
	cd Business-ISBN-Data-20140910.002
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
