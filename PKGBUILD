# CPAN Name  : Test::Class
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-test-class
pkgver=0.52
pkgrel=1
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
source=(http://search.cpan.org/CPAN/authors/id/S/SZ/SZABGAB/Test-Class-0.52.tar.gz)
md5sums=('dc70accee2dec2baa95d6df6f231dfa9')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Test-Class-0.52
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Test-Class-0.52
	sanitize
	make test
}

package() {
	cd Test-Class-0.52
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
