# CPAN Name  : Apache::LogFormat::Compiler
# Contributor: Christian Sturm <reezer@reezer.org>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-apache-logformat-compiler
pkgver=0.36
pkgrel=1
pkgdesc='Perl module to compile apache log format string to Perl code'
arch=('any')
url='https://metacpan.org/release/Apache-LogFormat-Compiler'
license=('PerlArtistic' 'GPL')
depends=(
	'perl>=5.8.5'
	'perl-posix-strftime-compiler>=0.30'
)
makedepends=('perl-module-build-tiny>=0.035')
checkdepends=(
	'perl-http-message'
	'perl-test-mocktime'
	'perl-test-requires'
	'perl-try-tiny>=0.12'
	'perl-uri>=1.60'
)
source=(http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Apache-LogFormat-Compiler-0.36.tar.gz)
options=(!emptydirs)
md5sums=('a0cdfcd875cb2ee4dc9a2c24381eb55b')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Apache-LogFormat-Compiler-0.36
	sanitize
	perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd Apache-LogFormat-Compiler-0.36
	sanitize
	perl Build test
}

package() {
	cd Apache-LogFormat-Compiler-0.36
	sanitize
	perl Build install
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
