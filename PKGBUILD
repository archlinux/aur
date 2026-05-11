# Maintainer: Rodney Annand <annand.rodney at gmail dot com>

pkgname=putmpv-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop app for browsing Put.io media and handing playback off to MPV"
arch=('x86_64')
url="https://github.com/X0RA/Slint_PutMPV"
license=('MIT')
depends=('mpv' 'openssl' 'fontconfig' 'gcc-libs' 'glibc')
provides=('putmpv')
conflicts=('putmpv')
source=("PutMPV-${pkgver}::https://github.com/X0RA/Slint_PutMPV/releases/download/${pkgver}/putmpv-linux-x86_64"
        "LICENSE::https://raw.githubusercontent.com/X0RA/Slint_PutMPV/main/LICENSE"
        "putmpv.png"
        "putmpv.desktop")
sha256sums=('984c4ea890a7ffa20e061508d01323e786bb7b3c0eee57c7bd3cc5bd3ffb9b71'
            'f1792d4b05b3c2e0f3aeeebf3e0b218e28c6e86bdc26914e3ad21371c588c841'
            'fb051655d5ffe59407b6693dc793f7a65b56d0826c52b98d372b18efbac95aa5'
            'ba6cacfa9c71477dd822865a2dac8360fb26a858c22be7f81e0322a0547b3111')

package() {
    install -Dm755 "${srcdir}/PutMPV-${pkgver}" "${pkgdir}/usr/bin/putmpv"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/putmpv.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/putmpv.png"
    install -Dm644 "${srcdir}/putmpv.desktop" "${pkgdir}/usr/share/applications/putmpv.desktop"
}
