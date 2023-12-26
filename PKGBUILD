# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen
pkgver=0.0.6
pkgrel=1
pkgdesc='WireGuard vanity key generator'
arch=('any')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('custom')
depends=('glibc')
makedepends=('go>=1.11')
source=("https://raw.githubusercontent.com/axllent/wireguard-vanity-keygen/${pkgver}/LICENSE"
        "${pkgname}-${pkgver}::https://github.com/axllent/wireguard-vanity-keygen/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2cb653ca639b18430adce010d0e294db83c120c83fa32d13ea1abb17cca98c32'
            'e68ca8049e615d2d3df19575692cd7d03daeced832b103631b857d123741c496')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make clean build
}

package() {
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
