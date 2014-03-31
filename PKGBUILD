# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=CSS-Inliner
cpanauthor=KAMELKEV
pkgname=perl-css-inliner
pkgver=3936
pkgrel=1
pkgdesc="Perl CSS::Inliner CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-html-query' 'perl-html-treebuilder-xpath' 'perl-libwww' 'perl-uri')
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('047fa69f3d9e61d0cf9c7ea7eb78e0d3d33fb9ff6b180d6eafe53c26b0121c4a')

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
