# CPAN Name  : Apache::LogFormat::Compiler
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-apache-logformat-compiler
pkgver=0.32
pkgrel=1
pkgdesc='Perl module to compile apache log format string to Perl code'
arch=('any')
url='http://search.cpan.org/dist/Apache-LogFormat-Compiler'
license=('PerlArtistic' 'GPL')
depends=(
	'perl>=5.8.5'
	'perl-posix-strftime-compiler>=0.30'
)
makedepends=(
	'perl-module-build>=0.38'
	'perl-cpan-meta'
)
checkdepends=(
	'perl-http-message'
	'perl-test-mocktime'
	'perl-test-requires'
	'perl-try-tiny>=0.12'
	'perl-uri>=1.60'
)
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Apache-LogFormat-Compiler-0.32.tar.gz)
options=(!emptydirs)
md5sums=('0abb3275f934c7ac41d7a83c7d0565ad')

build() {
	cd Apache-LogFormat-Compiler-0.32
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT
	PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd Apache-LogFormat-Compiler-0.32
	perl Build test
}

package() {
	cd Apache-LogFormat-Compiler-0.32
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
