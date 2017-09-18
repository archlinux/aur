# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname='Crypt-Random-Source'
cpanauthor=ETHER
pkgname=perl-crypt-random-source
pkgver=0.12
pkgrel=3
pkgdesc='Perl Crypt::Random::Source CPAN module - load and instantiate sources of random data'
arch=('any')
url='http://search.cpan.org/dist/${cpaname}/'
license=(GPL)
depends=(
    perl-capture-tiny
    perl-module-build-tiny
    perl-module-find
    perl-module-runtime
    perl-moo
    perl-namespace-clean
    perl-sub-exporter
    perl-test-exception
    perl-type-tiny
)
provides=(perl-crypt-random-source-factory)
conflicts=(perl-crypt-random-source-factory)
replaces=(perl-crypt-random-source-factory)
options=(!emptydirs)
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha512sums=('821f464a9b344cd7e19f881acbf295a39ccf3b924f8822acb757c06f7ed2aa95fbee740b98a514dfdd24aae2dc9b5c7898751eab5bf7ea6f88218a6b162c4c34')

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
