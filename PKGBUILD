# Maintainer: Christian Hesse <mail@eworm.de>
# CPAN Name: Module-Starter

pkgname=perl-module-starter
pkgver=1.73
pkgrel=1
pkgdesc='a simple starter kit for any module'
arch=('any')
url='http://search.cpan.org/dist/Module-Starter/'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-path-class' 'perl-module-runtime')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/D/DB/DBOOK/Module-Starter-${pkgver}.tar.gz")
sha256sums=('80299e53b7e4db4840dd7174740ea60a679cbb38a5e17d256a0f82fd9b3b8ae5')

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

