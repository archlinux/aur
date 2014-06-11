# CPAN Name  : Set::Intersection
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-set-intersection
pkgver=0.02
pkgrel=2
pkgdesc='Perl package to get intersection (of set theory) of ARRAYs.'
arch=('any')
url='http://search.cpan.org/dist/Set-Intersection'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/T/TU/TURUGINA/Set-Intersection-0.02.tar.gz)
options=(!emptydirs)
md5sums=('d373ed67980d1495b8c6f7ea73cc9985')

build() {
	cd Set-Intersection-0.02
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Set-Intersection-0.02
	make test
}

package() {
	cd Set-Intersection-0.02
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
