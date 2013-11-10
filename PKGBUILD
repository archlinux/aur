# CPAN Name  : Devel::Pragma
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-devel-pragma
pkgver=0.60
pkgrel=1
pkgdesc='Perl module providing helper functions for developers of lexical pragmas'
arch=('any')
url='http://search.cpan.org/dist/Devel-Pragma'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-extutils-depends>=0.302' 'perl-b-hooks-op-annotation>=0.44' 'perl-b-hooks-op-check>=0.19' 'perl-lexical-sealrequirehints>=0.007')
source=(http://search.cpan.org/CPAN/authors/id/C/CH/CHOCOLATE/Devel-Pragma-0.60.tar.gz)
options=(!emptydirs)
md5sums=('495b5b3a230a9894940955edec252cc0')

build() {
	cd Devel-Pragma-0.60
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Devel-Pragma-0.60
	make test
}

package() {
	cd Devel-Pragma-0.60
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
