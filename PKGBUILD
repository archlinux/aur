# CPAN Name  : Test::Class
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-test-class
pkgver=0.50
pkgrel=2
pkgdesc='Perl module to easily create test classes in an xUnit/JUnit style'
arch=('any')
url='https://metacpan.org/release/Test-Class'
license=('GPL')
options=(!emptydirs)
depends=(
	'perl-attribute-handlers>=0.77'
	'perl-mro-compat>=0.11'
	'perl-try-tiny'
	'perl-module-runtime')
checkdepends=(
	'perl-test-exception>=0.25')
source=(http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-Class-0.50.tar.gz)
md5sums=('4cc3aaad36b72f424ed90122701d2451')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Test-Class-0.50
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Test-Class-0.50
	sanitize
	make test
}

package() {
	cd Test-Class-0.50
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
