# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Devel-CallChecker
cpanauthor=ZEFRAM
pkgname=perl-devel-callchecker
pkgver=0.008
pkgrel=1
pkgdesc="Perl Devel::CallChecker CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-dynaloader-functions')
makedepends=('perl-module-build' 'perl-test-pod' 'perl-test-pod-coverage')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('5d584e0bf55942517fbb13bea5bff0bdf0d0287c0912030e853fa028a69011dc')

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
    ./Build install --installdir vendor --destdir "${pkgdir}"
}
