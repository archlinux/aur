# CPAN Name  : autodie
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-autodie
pkgver=2.32
pkgrel=1
pkgdesc='Replace functions with ones that succeed or die with lexical scope'
arch=('any')
url='https://metacpan.org/release/autodie'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8')
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/autodie-2.32.tar.gz)
options=(!emptydirs)
md5sums=('8e28b6c0eea1d8d79407e23de270db3c')

build() {
	cd autodie-2.32
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd autodie-2.32
	make test
}

package() {
	cd autodie-2.32
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
