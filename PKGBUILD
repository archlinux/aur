# CPAN Name  : autodie
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-autodie
pkgver=2.34
pkgrel=1
pkgdesc='Replace functions with ones that succeed or die with lexical scope'
arch=('any')
url='https://metacpan.org/release/autodie'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.8')
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/autodie-2.34.tar.gz)
options=(!emptydirs)
md5sums=('e1d9609ed1655f951151ee4cd2a14fa4')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd autodie-2.34
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd autodie-2.34
	sanitize
	make test
}

package() {
	cd autodie-2.34
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
