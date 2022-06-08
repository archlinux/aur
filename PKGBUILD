# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname='Crypt-Random-Source'
cpanauthor=ETHER
pkgname=perl-crypt-random-source
pkgver=0.14
pkgrel=5
pkgdesc='Perl Crypt::Random::Source CPAN module - load and instantiate sources of random data'
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=(GPL)
makedepends=(
    perl-module-build-tiny
)
depends=(
    perl-capture-tiny
    perl-module-find
    perl-module-runtime
    perl-moo
    perl-namespace-clean
    perl-sub-exporter
    perl-sub-name
    perl-test-fatal
    perl-type-tiny
    perl-yaml
)
provides=(perl-crypt-random-source-factory)
conflicts=(perl-crypt-random-source-factory)
replaces=(perl-crypt-random-source-factory)
options=(!emptydirs)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha512sums=('25760ccfae42f44bd132915e3796042b43c1bc43195a97fc1236579c90b96957b3d86d2e68adde9d7dd486336f132982867413af251c66e527584e7309e0c729')

build() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    perl Makefile.PL
    make
}

check() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
