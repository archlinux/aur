# CPAN Name  : Games::Poker::HandEvaluator
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-games-poker-handevaluator
pkgver=1.1
pkgrel=3
pkgdesc='Perl package for evaluating of poker hands'
arch=('i686' 'x86_64')
url='https://metacpan.org/release/Games-Poker-HandEvaluator'
license=('PerlArtistic' 'GPL')
depends=('perl' 'poker-eval')
source=(http://search.cpan.org/CPAN/authors/id/S/SI/SIMON/Games-Poker-HandEvaluator-1.1.tar.gz makefile.patch)
options=(!emptydirs)
md5sums=('cbc1be13691044d323e75747a5bdb4b6' '8c79763e912a894a9bc5ddbd6932e4ba')

build() {
	cd Games-Poker-HandEvaluator-1.1
	patch -i ../makefile.patch
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Games-Poker-HandEvaluator-1.1
	make test
}

package() {
	cd Games-Poker-HandEvaluator-1.1
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
