# CPAN Name  : POSIX::strftime::Compiler
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-posix-strftime-compiler
pkgver=0.31
pkgrel=1
pkgdesc='Perl module providing GNU C library compatible strftime for loggers and servers'
arch=('any')
url='http://search.cpan.org/dist/POSIX-strftime-Compiler'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.4')
makedepends=(
	'perl-module-build>=0.38'
	'perl-cpan-meta'	
)
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/POSIX-strftime-Compiler-0.31.tar.gz)
options=(!emptydirs)
md5sums=('c8b188fe58a87628d5a800acd99c2349')

build() {
	cd POSIX-strftime-Compiler-0.31
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT
	PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd POSIX-strftime-Compiler-0.31
	perl Build test
}

package() {
	cd POSIX-strftime-Compiler-0.31
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
