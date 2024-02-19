# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Sub-Infix
cpanauthor=TOBYINK
pkgname=perl-sub-infix
pkgver=0.004
pkgrel=1
pkgdesc="Perl Sub::Infix CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-test-fatal')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('5caeaada66ab4afdfdae56c023e099880543a9a7c1f931f20a834d5881c15ecb')

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
