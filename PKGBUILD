# CPAN Name  : Set::Intersection
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-set-intersection
pkgver=0.04
pkgrel=2
pkgdesc='Perl package to get intersection (of set theory) of ARRAYs.'
arch=('any')
url='https://metacpan.org/release/Set-Intersection'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/T/TU/TURUGINA/Set-Intersection-0.04.tar.gz)
options=(!emptydirs)
md5sums=('780910ae60f3e91c547db69f0ebb6c4e')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Set-Intersection-0.04
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Set-Intersection-0.04
	sanitize
	make test
}

package() {
	cd Set-Intersection-0.04
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
