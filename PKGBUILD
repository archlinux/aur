# CPAN Name  : Text::Lorem
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-text-lorem
pkgver=0.34
pkgrel=1
pkgdesc='Perl package and tool to generate random Latin looking text'
arch=('any')
url='https://metacpan.org/release/Text-Lorem'
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/A/AD/ADEOLA/Text-Lorem-0.34.tar.gz)
options=(!emptydirs)
md5sums=('18837055204e72bcb56d972c912795c7')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Text-Lorem-0.34
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Text-Lorem-0.34
	sanitize
	make test
}

package() {
	cd Text-Lorem-0.34
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
