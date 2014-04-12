# CPAN Name  : autodie
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-autodie
pkgver=2.25
pkgrel=1
pkgdesc='Replace functions with ones that succeed or die with lexical scope'
arch=('any')
url='http://search.cpan.org/dist/autodie'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8')
source=(http://search.cpan.org/CPAN/authors/id/P/PJ/PJF/autodie-2.25.tar.gz)
options=(!emptydirs)
md5sums=('6bf7df62326e7e22e2916eb82bc12a40')

build() {
	cd autodie-2.25
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd autodie-2.25
	make test
}

package() {
	cd autodie-2.25
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
