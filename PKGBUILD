# CPAN Name  : DBIx::DBSchema
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-dbix-dbschema
pkgver=0.47
pkgrel=1
pkgdesc='Perl modile providing database-independent schema objects'
arch=('any')
url='https://metacpan.org/release/DBIx-DBSchema'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-dbi')
source=(http://search.cpan.org/CPAN/authors/id/I/IV/IVAN/DBIx-DBSchema-0.47.tar.gz)
options=(!emptydirs)
md5sums=('ca15737627155652949aa78e1a9c1ebf')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd DBIx-DBSchema-0.47
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd DBIx-DBSchema-0.47
	sanitize
	make test
}

package() {
	cd DBIx-DBSchema-0.47
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
