# Maintainer: Christian Hesse <mail@eworm.de>
# CPAN Name: Module-Starter

pkgname=perl-module-starter
pkgver=1.71
pkgrel=1
pkgdesc='a simple starter kit for any module'
arch=('any')
url='http://search.cpan.org/dist/Module-Starter'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-path-class')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/Module-Starter-${pkgver}.tar.gz")
sha256sums=('e1b967f5c6b21cdfad0fe1eafd5681705d79bb5696db02ad9b5327e157bb050a')

build() {
	cd "${srcdir}/Module-Starter-${pkgver}"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	perl Makefile.PL
	make
}

check() {
	cd "${srcdir}/Module-Starter-${pkgver}"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	make test
}


package() {
	cd "${srcdir}/Module-Starter-${pkgver}"

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

