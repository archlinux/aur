# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=DynaLoader-Functions
cpanauthor=ZEFRAM
pkgname=perl-dynaloader-functions
pkgver=0.004
pkgrel=1
pkgdesc="Perl DynaLoader::Functions CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
makedepends=(perl-test-pod{,-coverage})
depends=('perl' 'perl-module-build')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('5e8e424671a0b2f1d9dff30e5f99087e7555880eb5d79a328b31f4cd4992983d')

build() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    perl Build.PL
    ./Build
}

check() {
    cd "${srcdir}/${cpaname}-${pkgver}"
    ./Build test
}

package () {
    cd "${srcdir}/${cpaname}-${pkgver}"
    ./Build install --installdirs vendor --destdir "${pkgdir}"
}
