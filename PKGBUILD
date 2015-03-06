# CPAN Name  : MooseX::Getopt
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-moosex-getopt
pkgver=0.68
pkgrel=1
pkgdesc='A Moose role for processing command line options'
arch=('any')
url='http://search.cpan.org/dist/MooseX-Getopt'
license=('PerlArtistic' 'GPL')
builddepends=('perl-module-build-tiny>=0.039')
depends=(
	'perl>=5.8.9'
	'perl-getopt-long-descriptive>=0.088'
	'perl-moose>=0.56'
	'perl-moosex-role-parameterized'
	'perl-try-tiny')
checkdepends=(
	'perl>=5.10.1'
	'perl-cpan-meta-check>=0.007'
	'perl-module-runtime'
	'perl-path-tiny>=0.009'
	'perl-test-checkdeps>=0.006'
	'perl-test-deep'
	'perl-test-fatal>=0.003'
	'perl-test-requires'
	'perl-test-trap'
	'perl-test-warnings'
	'perl-namespace-autoclean')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Getopt-0.68.tar.gz)
options=(!emptydirs)
md5sums=('9016a352e86b8235a4578b2b86105b45')

build() {
	cd MooseX-Getopt-0.68
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT
	PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd MooseX-Getopt-0.68
	perl Build test
}

package() {
	cd MooseX-Getopt-0.68
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
