# CPAN Name  : MooseX::Getopt
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname=perl-moosex-getopt
pkgver=0.62
pkgrel=1
pkgdesc='A Moose role for processing command line options'
arch=('any')
url='http://search.cpan.org/dist/MooseX-Getopt'
license=('PerlArtistic' 'GPL')
builddepends=('perl-module-build-tiny>=0.030')
depends=('perl>=5.8.9'
	'perl-getopt-long-descriptive>=0.081'
	'perl-moose>=0.56'
	'perl-moosex-role-parameterized'
	'perl-try-tiny')
# checkdepends=('perl-cpan-meta-check>=0.007'
#	'perl-module-runtime'
#	'perl-path-tiny>=0.009'
#	'perl-test-checkdeps>=0.006'
#	'perl-test-deep'
#	'perl-test-fatal>=0.003'
#	'perl-test-requires' 
#	'perl-test-trap'
#	'perl-test-warnings')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Getopt-0.62.tar.gz)
options=(!emptydirs)
md5sums=('f0f9413875a09e86f740602c31c86df3')

build() {
	cd MooseX-Getopt-0.62
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT
	PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build.PL --installdirs vendor --destdir "$pkgdir"
	perl Build
}

# check() {
#	cd MooseX-Getopt-0.62
#	perl Build test
# }

package() {
	cd MooseX-Getopt-0.62
	perl Build install
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
