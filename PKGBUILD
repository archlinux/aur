# CPAN Name  : List::Permutor
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-list-permutor
pkgver=0.022
pkgrel=2
pkgdesc='Perl package to process all possible permutations of a list'
arch=('any')
url='http://search.cpan.org/dist/List-Permutor'
license=('unknown')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/P/PH/PHOENIX/List-Permutor-0.022.tar.gz)
options=(!emptydirs)
md5sums=('b5c0f922730b9493c7c1e0583a5c8f78')

build() {
	cd List-Permutor-0.022
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd List-Permutor-0.022
	make test
}

package() {
	cd List-Permutor-0.022
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
