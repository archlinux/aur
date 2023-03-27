# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=soundsync
pkgname="${_pkgname}-bin"
pkgver=0.4.16
pkgrel=2
pkgdesc="Virtual cables between any audio source and any speaker in your home"
arch=('x86_64')
url="https://soundsync.app/"
_githuburl="https://github.com/geekuillaume/soundsync"
license=('custom')
conflicts=("${_pkgname}")
depends=(python nss libpulse at-spi2-core gtk3 nodejs libxext libxrandr glib2 nspr alsa-lib bash dbus gcc-libs mesa libxkbcommon expat \
    libx11 glibc libcups libxdamage cairo libxcomposite libxcb hicolor-icon-theme libdrm libxshmfence gdk-pixbuf2 pango libxfixes)
source=("${_pkgname}-${pkgver}.pacman::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-x64-${pkgver}.pacman"
        "LICENSE::https://github.com/geekuillaume/soundsync/raw/master/LICENSE")
sha256sums=('12bd6190537d80a29fa89fa2fa37da310593d5e6c54a7fe9f16c5f1509d4b94c'
            '8c1b730d0ff382f3a01bd5d7495818b926d49692065e0fba6947691a237215e9')
 
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/scalable"
    rm -rf "${pkgdir}/opt/Soundsync/resources/app/node_modules/ajv/scripts/info" "${pkgdir}/opt/Soundsync/resources/app/node_modules/sshpk/man"
}