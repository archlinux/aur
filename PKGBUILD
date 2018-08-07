# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=CSS-Inliner
cpanauthor=KAMELKEV
pkgname=perl-css-inliner
pkgver=4008
pkgrel=2
pkgdesc="Perl CSS::Inliner CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-html-query' 'perl-html-treebuilder-xpath' 'perl-libwww' 'perl-uri')
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('14c2214a5e6c3941d0b0eed04832ed1df08466beef60a2e9adedb0c1d97b9a1b')

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
