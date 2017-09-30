# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=perl-config-auto
pkgver=0.44
pkgrel=1
pkgdesc='Magical config file parser'
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~bingos/Config-Auto-${pkgver}/lib/Config/Auto.pm"
depends=('perl')
source=("http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/Config-Auto-${pkgver}.tar.gz")
sha512sums=('8102100c6c8fb0f644aecf429c265a3ed502497576cfbcbb011697a0eced072ae8e912eec99dc74796382a394036ade88df7b93d1a2882cd381ae789c71196f9')
arch=('any')

build() {
	cd "${srcdir}/Config-Auto-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	/usr/bin/perl Makefile.PL
	make
}

package() {
	cd "${srcdir}/Config-Auto-${pkgver}"
	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
