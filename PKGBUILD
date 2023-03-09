# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soundsync-bin
_pkgname=soundsync
pkgver=0.4.16
pkgrel=1
pkgdesc="Virtual cables between any audio source and any speaker in your home"
arch=('x86_64')
url="https://soundsync.app/"
_githuburl="https://github.com/geekuillaume/soundsync"
license=('BSL1.1')
options=()
conflicts=(soundsync)
depends=(python nss libpulse at-spi2-core gtk3 nodejs-lts-fermium)
source=("${_pkgname}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-x64-${pkgver}.pacman"
        "LICENSE::https://github.com/geekuillaume/soundsync/raw/master/LICENSE")
sha256sums=('12bd6190537d80a29fa89fa2fa37da310593d5e6c54a7fe9f16c5f1509d4b94c'
            '28e0b8f26c2467e860d06defe5697014f09fcca5aeb7a56790e4269e025d80e3')
 
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/scalable"
}