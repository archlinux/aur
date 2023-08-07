# Maintainer: Christian Hesse <mail@eworm.de>
# CPAN Name: Module-Starter

pkgname=perl-module-starter
pkgver=1.77
pkgrel=3
pkgdesc='a simple starter kit for any module'
arch=('any')
url='https://metacpan.org/release/Module-Starter'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-path-class' 'perl-module-runtime')
checkdepends=('perl-software-license')
options=('!emptydirs')
source=("http://www.cpan.org/authors/id/D/DB/DBOOK/Module-Starter-${pkgver}.tar.gz")
sha256sums=('108717def4755145fdccffbcb3cd5b9a9405e8139b9e54293ced83064982ea0d')

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

