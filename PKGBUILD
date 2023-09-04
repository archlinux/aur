# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=less-player-bin
_appname="Less Player"
pkgver=0.1.17_dev_2
pkgrel=1
pkgdesc="Less is More~ All for One, One for All ! Less Player, 一款基于Electron + Vue3开发的播放器 !"
arch=('x86_64')
url="https://github.com/GeekLee2012/Less-Player-Desktop/"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.asar::${url}/releases/download/v${pkgver//_/-}/app.asar"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/GeekLee2012/Less-Player-Desktop/main/public/icon%402x.png"
    "${pkgname%-bin}.sh")
sha256sums=('716ada5ed0a130bf381643d51fff2a1799de054908180c4fd56478947158cba9'
            'fb0c18a25174bf87a2fd5b445b8c2b78a0a90e1cc040b7f0b289e08e05c882af'
            '592c092a0853f23ed43ee8ce91021fb8d7fe19de4e6a34388f3679ca05c9c747')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "AudioVideo" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}