# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Kavorka
cpanauthor=TOBYINK
pkgname=perl-kavorka
pkgver=0.039
pkgrel=1
pkgdesc="Perl Kavorka CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
checkdepends=(
    'perl-moosex-types'
)
depends=(
    'perl'
    'perl-class-tiny'
    'perl-data-alias'
    'perl-datetime'
    'perl-exporter-tiny'
    'perl-match-simple'
    'perl-module-runtime'
    'perl-moo'
    'perl-moose'
    'perl-mouse'
    'perl-namespace-sweep'
    'perl-padwalker'
    'perl-parse-keyword'
    'perl-return-type'
    'perl-test-requires'
    'perl-test-fatal'
    'perl-type-tiny'
)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('8ff1609ef63c278e9de571d24c68fa8ecba64a52dc76ae5de206c06f030ffa2f')

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
