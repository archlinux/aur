# CPAN Name  : Ouch
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-ouch
pkgver=0.0408
pkgrel=1
pkgdesc="Perl module for exceptions that don't hurt"
arch=('any')
url='http://search.cpan.org/dist/Ouch'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1')
checkdepends=('perl-test-trap')
source=(http://search.cpan.org/CPAN/authors/id/R/RI/RIZEN/Ouch-0.0408.tar.gz)
options=(!emptydirs)
md5sums=('f3cd70271ba8f7598569bc04097b7881')

build() {
	cd Ouch-0.0408
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Ouch-0.0408
	make test
}

package() {
	cd Ouch-0.0408
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
