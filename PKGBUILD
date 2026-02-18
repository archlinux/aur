# Maintainer: Christian Hesse <mail@eworm.de>
# CPAN Name: Module-Starter

pkgname=perl-module-starter
pkgver=1.82
pkgrel=1
pkgdesc='a simple starter kit for any module'
arch=('any')
url='https://metacpan.org/release/Module-Starter'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-path-class' 'perl-module-runtime')
checkdepends=('perl-software-license')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/X/XS/XSAWYERX/Module-Starter-${pkgver}.tar.gz")
sha256sums=('213c0eb0cc13167dd1fa1ecc2af39f7225911f18b14a89e0c1566456270bcbf5')

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

