# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=String-Approx
cpanauthor=JHI
pkgname=perl-string-approx
pkgver=3.27
pkgrel=1
pkgdesc="Perl String::Approx CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('2b8c1acd24fa9681ebba0ccb3c49f16289de1d579af8a0c898ea8f8d1baf5d36')

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
