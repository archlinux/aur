# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=match-simple
cpanauthor=TOBYINK
pkgname=perl-match-simple
pkgver=0.012
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
sha256sums=('b7349a9fa926d503472998d1e0b8c3a7fcae0edc7ce30ada4ee756cdb252a37c')

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
