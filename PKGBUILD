# Maintainer: Baron Hou <houbaron@gmail.com>
pkgname=picgo-appimage
pkgver=1.6.2
pkgrel=4

pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64')
url="https://molunerfinn.com/PicGo/"
license=('MIT')
noextract=("picgo-${pkgver}-${arch}.AppImage")
source=(
    "https://github.com/Molunerfinn/PicGo/releases/download/v${pkgver}/picgo-${pkgver}-${arch}.AppImage"
    "picgo.png"
    "picgo.desktop"
)
sha256sums=(
    '9dc232e25855b05de43332e795aa141652dd0bf3ced2f9948636c46a2822aed2'
    'SKIP'
    'SKIP'
)

package() {
    cp             picgo-${pkgver}-${arch}.AppImage ${pkgdir}/opt/appimages/picgo.AppImage
    chmod      755                                  ${pkgdir}/opt/appimages/picgo.AppImage
    install -Dm644 picgo.desktop                    ${pkgdir}/usr/share/applications/picgo.desktop
    install -Dm644 picgo.png                        ${pkgdir}/usr/share/icons/hicolor/256x256/apps/picgo.png
}