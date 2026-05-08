# Maintainer: François Pansera <contact@ironcall.dev>
pkgname=ironcall-bin
pkgver=0.6.0
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
    'db8adb067a6e737beb95a3bd063462114bbbb2a12715d8acf7326ebbfad8a430'
    'd02152139e16601f82fad44673b4743262007af55d012e20eb7a004e23027519'
    '1a0afe0dca9ca6e7cdef7f94b5fe854a55ae0bfa3796e87537647f0983a385ef'
)

package() {
    install -Dm755 "ironcall-${pkgver}-linux-x86_64/ironcall" "${pkgdir}/usr/bin/ironcall"
    install -Dm644 "${srcdir}/ironcall.desktop" "${pkgdir}/usr/share/applications/ironcall.desktop"
    install -Dm644 "${srcdir}/ironcall.png" "${pkgdir}/usr/share/pixmaps/ironcall.png"
}
