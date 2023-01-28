# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=String-Approx
cpanauthor=JHI
pkgname=perl-string-approx
pkgver=3.28
pkgrel=1
pkgdesc="Perl String::Approx CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('43201e762d8699cb0ac2c0764a5454bdc2306c0771014d6c8fba821480631342')

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
