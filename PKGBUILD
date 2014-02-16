# CPAN Name  : Tree::Binary
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-tree-binary
pkgver=1.05
pkgrel=1
pkgdesc='Perl package for OO binary tree'
arch=('any')
url='http://search.cpan.org/dist/Tree-Binary'
license=('PerlArtistic' 'GPL')
depends=('perl')
checkdepends=('perl-test-exception')
source=(http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Tree-Binary-1.05.tgz)
options=(!emptydirs)
md5sums=('4219fe4109544194e8fd6e5cb2e6b1f6')

build() {
	cd Tree-Binary-1.05
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Tree-Binary-1.05
	make test
}

package() {
	cd Tree-Binary-1.05
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
