# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Devel-CallChecker
cpanauthor=ZEFRAM
pkgname=perl-devel-callchecker
pkgver=0.007
pkgrel=1
pkgdesc="Perl Devel::CallChecker CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-dynaloader-functions')
makedepends=('perl-module-build' 'perl-test-pod' 'perl-test-pod-coverage')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('9ca3b70f7a9e5d8758eabd39a5ff2e23ec7aa14ab23d3ebaac5f90343f0e346d')

build() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 perl Makefile.PL
	 make
}

check() {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make test
}

package () {
	 cd "${srcdir}/${cpaname}-${pkgver}"
	 make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
