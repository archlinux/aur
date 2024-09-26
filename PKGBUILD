# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: vtyulb

pkgname=vk-calls-bin
pkgbasename='vk-calls'
pkgver=1.36.23357
pkgrel=1
pkgdesc="VK Calls for fast conference calls"
arch=('x86_64')
url="https://vk.com/video-calls"
license=('custom')
depends=('gcc' 'hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'openssl-1.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgbasename}-${pkgver}-amd64.deb::https://vkcalls-native-ac.vk-apps.com/${pkgver}/${pkgbasename}-amd64.deb")
sha256sums=('SKIP')

package() {
    # Extract package data
    tar xzf data.tar.gz --no-same-owner -C "${pkgdir}"

    # Fix directory structure differences
    mv "${pkgdir}/usr/local/bin" "${pkgdir}/usr/"
    rm -rf "${pkgdir}/usr/local"
}
