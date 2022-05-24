# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Return-Type
cpanauthor=TOBYINK
pkgname=perl-return-type
pkgver=0.007
pkgrel=1
pkgdesc="Perl Return::Type CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-test-fatal' 'perl-type-tiny')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('0dffa4e3a7a63885da029d8f04e79d99d04e0f48b3b890d4509e209bb865e1b4')

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
