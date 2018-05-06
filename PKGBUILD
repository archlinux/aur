# CPAN Name  : Ouch
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-ouch
pkgver=0.0500
pkgrel=1
pkgdesc="Perl module for exceptions that don't hurt"
arch=('any')
url='https://metacpan.org/release/Ouch'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1')
checkdepends=('perl-test-trap')
source=(http://search.cpan.org/CPAN/authors/id/R/RI/RIZEN/Ouch-0.0500.tar.gz)
options=(!emptydirs)
md5sums=('9db2afc8dc3170e0f5a8f0601e670913')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Ouch-0.0500
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Ouch-0.0500
	sanitize
	make test
}

package() {
	cd Ouch-0.0500
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
