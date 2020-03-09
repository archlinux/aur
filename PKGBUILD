# CPAN Name  : DBIx::DBSchema
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-dbix-dbschema
pkgver=0.45
pkgrel=2
pkgdesc='Perl modile providing database-independent schema objects'
arch=('any')
url='https://metacpan.org/release/DBIx-DBSchema'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dbi')
source=(http://search.cpan.org/CPAN/authors/id/I/IV/IVAN/DBIx-DBSchema-0.45.tar.gz)
options=(!emptydirs)
md5sums=('45f2d5c134fd3f74afa378c8e33bc65f')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd DBIx-DBSchema-0.45
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd DBIx-DBSchema-0.45
	sanitize
	make test
}

package() {
	cd DBIx-DBSchema-0.45
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
