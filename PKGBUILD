# CPAN Name  : Test::Class
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-test-class
pkgver=0.47
pkgrel=1
pkgdesc='Perl module to easily create test classes in an xUnit/JUnit style'
arch=('any')
url='http://search.cpan.org/dist/Test-Class'
license=('GPL')
options=(!emptydirs)
depends=('perl>=5.19.6'
	'perl-attribute-handlers>=0.77'
	'perl-mro-compat>=0.11')
checkdepends=(
	'perl-test-exception>=0.25')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Class-0.47.tar.gz)
md5sums=('952f7ee1f490760a99e812eea33c053c')

build() {
	cd Test-Class-0.47
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Test-Class-0.47
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}

package() {
	cd Test-Class-0.47
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
