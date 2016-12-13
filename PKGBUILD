# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=JavaScript-Packer
cpanauthor=LEEJO
pkgname=perl-javascript-packer
pkgver=2.02
pkgrel=1
pkgdesc="Perl HTML::Packer CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('8f673cacec2680520f94a95cd44639bc4587f260b07497772ffdaac83b945f6c')

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
