# CPAN Name  : List::Permutor
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-list-permutor
pkgver=0.022
pkgrel=3
pkgdesc='Perl package to process all possible permutations of a list'
arch=('any')
url='https://metacpan.org/release/List-Permutor'
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
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
