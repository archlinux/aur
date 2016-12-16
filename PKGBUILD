# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=match-simple
cpanauthor=TOBYINK
pkgname=perl-match-simple
pkgver=0.009
pkgrel=1
pkgdesc="Perl match::simple CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
   'perl'
   'perl-exporter-tiny'
   'perl-sub-infix'
   'perl-test-fatal'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('ef9fc8ef4cdcfeebe1681f33f474ba5e2cee64ea586198e9b52881e2f0c47fdc')

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
