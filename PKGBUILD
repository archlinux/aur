# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: vtyulb

pkgname=vk-calls-bin
pkgbasename='vk-calls'
pkgver=1.42.36240
pkgrel=1
pkgdesc="VK Calls for fast conference calls"
arch=('x86_64')
url="https://calls.vk.com"
license=('custom')
depends=('gcc' 'hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-webengine' 'openssl-1.1')
options=('!strip' '!emptydirs')
install=$pkgname.install
source=("${pkgbasename}-${pkgver}-amd64.deb::https://vkcalls-native-ac.vk-apps.com/${pkgver}/${pkgbasename}-amd64.deb")
sha256sums=('ca7af14e4d959480c7422e2f1077d022bd64e426e90ff8b3857fe53f22d7b84f')

package() {
    # Extract package data
    tar xzf data.tar.gz --no-same-owner -C "${pkgdir}"

    # Fix directory structure differences
    mv "${pkgdir}/usr/local/bin" "${pkgdir}/usr/"
    rm -rf "${pkgdir}/usr/local"
}
