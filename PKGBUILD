# CPAN Name  : Tree::Binary
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-tree-binary
pkgver=1.06
pkgrel=1
pkgdesc='Perl package for OO binary tree'
arch=('any')
url='https://metacpan.org/release/Tree-Binary'
license=('PerlArtistic' 'GPL')
depends=('perl')
checkdepends=('perl-test-exception')
source=(http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Tree-Binary-1.06.tgz)
options=(!emptydirs)
md5sums=('3e7d5dc33b14ddf218bac30861093e12')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Tree-Binary-1.06
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Tree-Binary-1.06
	sanitize
	make test
}

package() {
	cd Tree-Binary-1.06
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
