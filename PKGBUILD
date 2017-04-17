# Maintainer: Christian Hesse <mail@eworm.de>
# CPAN Name: Module-Starter

pkgname=perl-module-starter
pkgver=1.72
pkgrel=1
pkgdesc='a simple starter kit for any module'
arch=('any')
url='http://search.cpan.org/dist/Module-Starter/'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-path-class')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/D/DB/DBOOK/Module-Starter-${pkgver}.tar.gz")
sha256sums=('dd924c521538d96c0e4b5a5c911945aba42ed28f9b194c9ffe04f6f8aaf61e10')

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

