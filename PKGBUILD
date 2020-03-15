# CPAN Name  : Tree::Binary
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-tree-binary
pkgver=1.08
pkgrel=2
pkgdesc='Perl package for OO binary tree'
arch=('any')
url='https://metacpan.org/release/Tree-Binary'
license=('PerlArtistic' 'GPL')
depends=('perl')
checkdepends=('perl-test-exception')
source=(http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Tree-Binary-1.08.tgz)
options=(!emptydirs)
md5sums=('76ac414085486e9104f3ada832c231db')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Tree-Binary-1.08
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Tree-Binary-1.08
	sanitize
	make test
}

package() {
	cd Tree-Binary-1.08
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
