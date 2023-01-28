# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=match-simple
cpanauthor=TOBYINK
pkgname=perl-match-simple
pkgver=0.011
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
sha256sums=('6d15dc09f479fe6aa2658a9e7bef811ee22bd755465b8f138e4289b9a46b61b8')

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
