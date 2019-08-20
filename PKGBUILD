# CPAN Name  : autodie
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-autodie
pkgver=2.29
pkgrel=2
pkgdesc='Replace functions with ones that succeed or die with lexical scope'
arch=('any')
url='https://metacpan.org/release/autodie'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8')
source=(http://search.cpan.org/CPAN/authors/id/P/PJ/PJF/autodie-2.29.tar.gz)
options=(!emptydirs)
md5sums=('2739e6599a2aa47601fe91b2a27b29d9')

build() {
	cd autodie-2.29
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd autodie-2.29
	make test
}

package() {
	cd autodie-2.29
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
