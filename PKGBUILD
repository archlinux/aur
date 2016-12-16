# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Kavorka
cpanauthor=TOBYINK
pkgname=perl-kavorka
pkgver=0.036
pkgrel=1
pkgdesc="Perl Kavorka CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=(
    'perl'
    'perl-data-alias'
    'perl-exporter-tiny'
    'perl-match-simple'
    'perl-module-runtime'
    'perl-moo'
    'perl-namespace-sweep'
    'perl-padwalker'
    'perl-parse-keyword'
    'perl-return-type'
    'perl-test-requires'
    'perl-test-fatal'
    'perl-type-tiny'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('eb5ce43e934240162eac18b29a97bec7e120ee9bd3163f8e7a654a36d69d8e5d')

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
