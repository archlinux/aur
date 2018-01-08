# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=libdop
pkgver=1.2.0
pkgrel=1
pkgdesc='Utilities library'
arch=('x86' 'x86_64')
url='https://github.com/dopsi/libdop'
license=('custom:MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dopsi/libdop/archive/v${pkgver}.tar.gz")
sha512sums=('8a03f3244a5cf05891c7d5d7cc1d443447760f229aced2239b4ce89abd3896d0307ac2826e9917f45173b17ea14eed0e457b7c32c99c1eeacb58b739496eec8c')

build () {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/build"
    make install
    install -D "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/libdop/LICENSE"
}

# vim:ts=4:sw=4:expandtab
