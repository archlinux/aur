# Maintainer: sandboiii <archlinux at sandboiii dot xyz>
# Contributor: vtyulb

pkgname=vk-calls-bin
pkgbasename='vk-calls'
pkgver=1.41.32145
pkgrel=1
pkgdesc="VK Calls for fast conference calls"
arch=('x86_64')
url="https://calls.vk.com"
license=('custom')
depends=('gcc' 'hicolor-icon-theme' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'openssl-1.1')
options=('!strip' '!emptydirs')
install=$pkgname.install
source=("${pkgbasename}-${pkgver}-amd64.deb::https://vkcalls-native-ac.vk-apps.com/latest/${pkgbasename}-amd64.deb")
sha256sums=('8fc59d0686494d04386fb313eb4ad3bbc3fe24bb365ed14ba66d230f4b4be68d')

package() {
    # Extract package data
    tar xzf data.tar.gz --no-same-owner -C "${pkgdir}"

    # Fix directory structure differences
    mv "${pkgdir}/usr/local/bin" "${pkgdir}/usr/"
    rm -rf "${pkgdir}/usr/local"
}
