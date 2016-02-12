# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=perl-crypt-random-source-factory
_dist='Crypt-Random-Source'
pkgver=0.06
pkgrel=1
pkgdesc='Load and instantiate sources of random data'
arch=('any')
url='http://search.cpan.org/~flora/Crypt-Random-Source-0.06/lib/Crypt/Random/Source/Factory.pm'
license=(GPL)
depends=(perl)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Crypt-Random-Source-${pkgver}.tar.gz")
sha512sums=('03f085e2f92abc6629440d4a47f298d652f2dcd59874ba742eb6578c2de3bcccde9af69e05cd89588702eb55b3be60bf6c34066e7c7c5ba450d4a7a0542a4623')

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
