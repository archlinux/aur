# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Keyword-Simple
cpanauthor=MAUKE
pkgname=perl-keyword-simple
pkgver=0.04
pkgrel=1
pkgdesc="Perl Keyword-Simple CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-b-hooks-endofscope')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('9455cb86b92c30027d6eeb5712a04a84d8a3863d399be6ebdd723e5e84d51305')

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
