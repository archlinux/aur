# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=CSS-Inliner
cpanauthor=KAMELKEV
pkgname=perl-css-inliner
pkgver=3948
pkgrel=1
pkgdesc="Perl CSS::Inliner CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-html-query' 'perl-html-treebuilder-xpath' 'perl-libwww' 'perl-uri')
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('463b99cbbaf32b05ddf9ff1615e53eae54cbc028b819e84f04e6c3d1d3c575a3')

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
