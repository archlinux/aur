# CPAN Name  : Ouch
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-ouch
pkgver=0.0501
pkgrel=2
pkgdesc="Perl module for exceptions that don't hurt"
arch=('any')
url='https://metacpan.org/release/Ouch'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.1')
checkdepends=('perl-test-trap')
source=(http://search.cpan.org/CPAN/authors/id/R/RI/RIZEN/Ouch-0.0501.tar.gz)
options=(!emptydirs)
md5sums=('b0d22965369f5e9f23acaad993968de1')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
}

build() {
	cd Ouch-0.0501
	sanitize
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Ouch-0.0501
	sanitize
	make test
}

package() {
	cd Ouch-0.0501
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
