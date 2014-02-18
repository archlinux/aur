# CPAN Name  : TOML
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-toml
pkgver=0.92
pkgrel=1
pkgdesc="Perl parser for Tom's Obvious, Minimal Language"
arch=('any')
url='http://search.cpan.org/dist/TOML'
license=('GPL2')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DARREN/TOML-0.92.tar.gz)
options=(!emptydirs)
md5sums=('a5f87a79b555a32c5c978811da99fab3')

build() {
	cd TOML-0.92
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd TOML-0.92
	make test
}

package() {
	cd TOML-0.92
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
