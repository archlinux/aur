# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=CSS-Inliner
cpanauthor=KAMELKEV
pkgname=perl-css-inliner
pkgver=4018
pkgrel=1
pkgdesc="Perl CSS::Inliner CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-html-query' 'perl-html-treebuilder-xpath' 'perl-libwww' 'perl-uri')
checkdepends=('perl-test-pod')
source=("http://search.cpan.org/CPAN/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('4b849dfaf7e42576d2adb5a674feb345a8a27a5a303f412e10dac531a3061183')

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
