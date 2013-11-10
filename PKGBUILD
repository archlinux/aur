# CPAN Name  : MooseX::Getopt
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-moosex-getopt
pkgver=0.58
pkgrel=1
pkgdesc='A Moose role for processing command line options'
arch=('any')
url='http://search.cpan.org/dist/MooseX-Getopt'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.9'
	'perl-getopt-long-descriptive>=0.081'
	'perl-moose>=0.56'
	'perl-moosex-role-parameterized'
	'perl-try-tiny'
	'perl-module-build-tiny>=0.027')
checkdepends=('perl-cpan-meta-check>=0.007'
	'perl-module-runtime'
	'perl-path-tiny>=0.009'
	'perl-test-checkdeps>=0.006'
	'perl-test-deep'
	'perl-test-fatal>=0.003'
	'perl-test-requires' 
	'perl-test-trap'
	'perl-test-warnings'
	'perl-config-any')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Getopt-0.58.tar.gz)
options=(!emptydirs)
md5sums=('8dca84e633fdbac70c221620f3bfb8ab')

build() {
	cd MooseX-Getopt-0.58
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT
	PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

check() {
	cd MooseX-Getopt-0.58
	perl Build test
}

package() {
	cd MooseX-Getopt-0.58
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
