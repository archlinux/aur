# Maintainer: François Pansera <contact@ironcall.dev>
pkgname=ironcall-bin
pkgver=0.7.10
pkgrel=1
pkgdesc="Ironcall - Local-first API client"
arch=('x86_64')
url="https://ironcall.dev"
license=('custom')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('ironcall')
conflicts=('ironcall')
source_x86_64=(
    "ironcall-${pkgver}-linux-x86_64.tar.gz::https://ironcall.dev/releases/desktop/${pkgver}/ironcall-${pkgver}-linux-x86_64.tar.gz"
    "ironcall.desktop"
    "ironcall.png"
)
sha256sums_x86_64=(
    'eb353df6ac313824f84827cd7d8ee4c2303b5d7ba692cdfd376cb62eb80b33ce'
    'd02152139e16601f82fad44673b4743262007af55d012e20eb7a004e23027519'
    '1a0afe0dca9ca6e7cdef7f94b5fe854a55ae0bfa3796e87537647f0983a385ef'
)

package() {
    install -Dm755 "ironcall-${pkgver}-linux-x86_64/ironcall" "${pkgdir}/usr/bin/ironcall"
    install -Dm644 "${srcdir}/ironcall.desktop" "${pkgdir}/usr/share/applications/ironcall.desktop"
    install -Dm644 "${srcdir}/ironcall.png" "${pkgdir}/usr/share/pixmaps/ironcall.png"
}
