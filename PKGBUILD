# CPAN Name  : Business::ISBN
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-business-isbn
pkgver=2.07
pkgrel=1
pkgdesc='Perl package to work with International Standard Book Numbers'
arch=('any')
url='http://search.cpan.org/dist/Business-ISBN'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-business-isbn-data>=20081208' 'perl-uri')
source=(http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Business-ISBN-2.07.tar.gz)
options=(!emptydirs)
md5sums=('c0049fb576b9fc3b2603bf7e9b3e91af')

build() {
	cd Business-ISBN-2.07
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Business-ISBN-2.07
	make test
}

package() {
	cd Business-ISBN-2.07
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
