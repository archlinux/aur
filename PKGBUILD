# Maintainer: Yamato Kobayashi <yk.ymadd@gmail.com>

pkgname=webrecorder-desktop-appimg
_pkgname=Webrecorder
pkgver=2.0.2
pkgrel=1
pkgdesc="The Webrecorder Desktop App is a complete packaging of Webrecorder hosted service as an Electron application, with an integrated Chromium browser."
provides=('webrecorder')
conflicts=('webrecorder')
arch=('x86_64')
url="https://github.com/webrecorder/webrecorder-desktop"
license=(unknown)
depends=('redis')
noextract=('Webrecorder.AppImage')
options=(!strip)
_appimg="Webrecorder.AppImage"

source=(
    "Webrecorder.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "webrecorder.desktop"
    "webrecorder.ico"
    )

sha512sums=(
    SKIP
    SKIP
    SKIP
)


package() {
    install -Dm755 $_appimg "${pkgdir}/usr/bin/webrecorder"
    install -Dm755 webrecorder.desktop "${pkgdir}/usr/share/applications/webrecorder.desktop"
    install -Dm644 webrecorder.ico "${pkgdir}/usr/share/icons/webrecorder.png"
    }
