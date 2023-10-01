# Maintainer: Yardena Cohen <yardenack at gmail dot com>

cpaname=Devel-CallChecker
cpanauthor=ZEFRAM
pkgname=perl-devel-callchecker
pkgver=0.009
pkgrel=1
pkgdesc="Perl Devel::CallChecker CPAN module"
arch=('any')
url="http://search.cpan.org/dist/${cpaname}/"
license=('unknown')
options=('!emptydirs')
depends=('perl' 'perl-dynaloader-functions')
makedepends=('perl-module-build' 'perl-test-pod' 'perl-test-pod-coverage')
source=("http://www.cpan.org/authors/id/${cpanauthor::1}/${cpanauthor::2}/${cpanauthor}/${cpaname}-${pkgver}.tar.gz")
sha256sums=('7a46caef9c48908f00fe8985dcecc4ec55f42e6c4efaafce9dbdaf9d45a37bc4')

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
