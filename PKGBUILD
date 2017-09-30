# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=perl-parse-debian-packages
pkgver=0.03
pkgrel=1
pkgdesc='Parse the data from a debian Packages.gz'
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Parse-Debian-Packages/lib/Parse/Debian/Packages.pm"
depends=('perl')
source=("http://search.cpan.org/CPAN/authors/id/R/RC/RCLAMP/Parse-Debian-Packages-0.03.tar.gz")
sha512sums=('0e0ac688f9bb06406d95205d659bdaee4f56afaa19f1924933bfa8f2ef627ee51bbb41283aa8cac1bc7dd49c54cfa9ec946611d179b7456d1eeb970eed37996e')
arch=('any')

build() {
	cd "${srcdir}/Parse-Debian-Packages-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make
}

package() {
	cd "${srcdir}/Parse-Debian-Packages-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
