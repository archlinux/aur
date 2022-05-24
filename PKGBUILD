# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=match-simple
cpanauthor=TOBYINK
pkgname=perl-match-simple
pkgver=0.010
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
sha256sums=('8ad6014d4e40240dc3358fbdc907fd39926551c180b3a4279f8da181f17f76cb')

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
