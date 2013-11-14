# CPAN Name  : Apache::LogFormat::Compiler
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-apache-logformat-compiler
pkgver=0.13
pkgrel=2
pkgdesc='Perl module to compile apache log format string to Perl code'
arch=('any')
url='http://search.cpan.org/dist/Apache-LogFormat-Compiler'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.5')
makedepends=(
	'perl>=5.13.11' # for Module::Build >= 0.38
)
checkdepends=(
	'perl-http-message'
	'perl-test-requires'
	'perl-try-tiny>=0.12'
	'perl-uri>=1.60'
)
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Apache-LogFormat-Compiler-0.13.tar.gz)
options=(!emptydirs)
md5sums=('fd04ee3f4c2164b7f7909d85f11e467a')

build() {
	cd Apache-LogFormat-Compiler-0.13
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT
	PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd Apache-LogFormat-Compiler-0.13
	perl Build test
}

package() {
	cd Apache-LogFormat-Compiler-0.13
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
