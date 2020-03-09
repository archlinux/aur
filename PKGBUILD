# CPAN Name  : Devel::Pragma
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-devel-pragma
pkgver=1.1.0
pkgrel=1
pkgdesc='Perl module providing helper functions for developers of lexical pragmas'
arch=('any')
url='https://metacpan.org/release/Devel-Pragma'
license=('PerlArtistic' 'GPL')
depends=('perl-lexical-sealrequirehints>=0.010')
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHOCOLATE/Devel-Pragma-1.1.0.tar.gz)
options=(!emptydirs)
md5sums=('0c5868b13e8630fb9e809af86eb76961')

build() {
	cd Devel-Pragma-1.1.0
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Devel-Pragma-1.1.0
	make test
}

package() {
	cd Devel-Pragma-1.1.0
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
