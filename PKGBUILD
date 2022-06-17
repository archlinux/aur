# CPAN Name  : Alien::GSL
# Contributor: Anton Leontiev <scileont /at/ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-alien-gsl
pkgver=1.07
pkgrel=1
pkgdesc='Building, finding and using GSL library'
arch=('any')
url='https://metacpan.org/release/Alien-GSL'
license=('PerlArtistic' 'GPL')
makedepends=('perl-alien-build' 'perl-net-ssleay'
	'perl-io-socket-ssl')
depends=('perl-alien-build' 'gsl')
source=(http://search.cpan.org/CPAN/authors/id/P/PL/PLICEASE/Alien-GSL-1.07.tar.gz)
options=(!emptydirs)
md5sums=('a5dee649d2af80624c99cf3554230d6b')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" MODULEBUILDRC=/dev/null
}

build() {
	cd Alien-GSL-1.07
	sanitize
	/usr/bin/perl Makefile.PL INSTALLDIRS=vendor
	make
}

check() {
	cd Alien-GSL-1.07
	sanitize
	make test
}

package() {
	cd Alien-GSL-1.07
	sanitize
	make install DESTDIR="$pkgdir"
	find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
