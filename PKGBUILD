# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=CSS-Inliner
cpanauthor=KAMELKEV
pkgname=perl-css-inliner
pkgver=4014
pkgrel=1
pkgdesc="Perl CSS::Inliner CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-html-query' 'perl-html-treebuilder-xpath' 'perl-libwww' 'perl-uri')
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('1e0ab0538574c5c144c81092e4ef95f11d9429a143c0896719ef7a45374dc0bf')

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
