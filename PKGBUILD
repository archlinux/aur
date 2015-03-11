# CPAN Name  : Business::ISBN
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-business-isbn
pkgver=2.09
pkgrel=1
pkgdesc='Perl package to work with International Standard Book Numbers'
arch=('any')
url='http://search.cpan.org/dist/Business-ISBN'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-business-isbn-data>=20140910' 'perl-uri')
source=(http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Business-ISBN-2.09.tar.gz)
options=(!emptydirs)
md5sums=('5ebf339c409d99cdfa6f96974ef96780')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Business-ISBN-2.09
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Business-ISBN-2.09
	sanitize
	make test
}

package() {
	cd Business-ISBN-2.09
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
