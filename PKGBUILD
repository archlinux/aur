# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname='perl-math-random-secure'
_dist='Math-Random-Secure'
pkgver='0.06'
pkgrel=1
pkgdesc='Cryptographically-secure, cross-platform replacement for rand()'
arch=('any')
url='http://search.cpan.org/~mkanat/Math-Random-Secure/'
license=('GPL')
depends=(perl-any-moose
         perl-crypt-random-source-factory
         perl-math-random-isaac
         perl-module-find)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/M/MK/MKANAT/Math-Random-Secure-${pkgver}.tar.gz")
sha512sums=('55e94f74608ab2f6acf605ef9244311f1635f291f4aebdeb494a4d962c95052d69eefa7cb8e96b58abc3de178d44ecf222467250626d67969edad0c1d91e6f2a')

build() {
    cd "${srcdir}"/"${_dist}"-"${pkgver}"
    perl Makefile.PL
    make
}

check() {
    cd "${srcdir}"/"${_dist}"-"${pkgver}"
    make test
}

package() {
    cd "${srcdir}"/"${_dist}"-"${pkgver}"
    make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
