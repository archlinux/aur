# CPAN Name  : POSIX::strftime::Compiler
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname=perl-posix-strftime-compiler
pkgver=0.41
pkgrel=1
pkgdesc='Perl module providing GNU C library compatible strftime for loggers and servers'
arch=('any')
url='https://metacpan.org/release/POSIX-strftime-Compiler'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.1')
makedepends=('perl-module-build>=0.38')
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/POSIX-strftime-Compiler-0.41.tar.gz)
options=(!emptydirs)
md5sums=('3cb849778e00f5d3894e7e78c2e629ce')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

build() {
	cd POSIX-strftime-Compiler-0.41
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd POSIX-strftime-Compiler-0.41
	sanitize
	perl Build test
}

package() {
	cd POSIX-strftime-Compiler-0.41
	sanitize
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
