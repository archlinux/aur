# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: vtyulb

pkgname=vk-calls-bin
pkgbasename='vk-calls'
pkgver=1.43.38550
pkgrel=1
pkgdesc="VK Calls for fast conference calls"
arch=('x86_64')
url="https://calls.vk.com"
license=('custom')
depends=('gcc' 'hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-webengine' 'icu76')
options=('!strip' '!emptydirs')
install=$pkgname.install
source=("${pkgbasename}-${pkgver}-amd64.deb::https://vkcalls-native-ac.vk-apps.com/${pkgver}/${pkgbasename}-amd64.deb")
sha256sums=('65076fd111a40a327b3ac3cf66268091afa00c05dd78be61234420c6fbeeaea3')

package() {
    # Extract package data
    tar xzf data.tar.gz --no-same-owner -C "${pkgdir}"

    # Fix directory structure differences
    mv "${pkgdir}/usr/local/bin" "${pkgdir}/usr/"
    rm -rf "${pkgdir}/usr/local"
}
