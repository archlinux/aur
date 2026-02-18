# Maintainer: Menghuan1918 <menghuan2003 at outlook dot com>
# Contributor: so1ar <so1ar114514@gmail.com>
# Contributor: Baron Hou <houbaron@gmail.com>


pkgname=picgo-appimage
pkgver=2.5.2
pkgrel=1
epoch=1

pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64')
url="https://molunerfinn.com/PicGo/"
license=('MIT')
noextract=("PicGo-${pkgver}-x86_64.AppImage")
options=("!strip")
source=(
    "https://github.com/Molunerfinn/PicGo/releases/download/v${pkgver}/PicGo-${pkgver}-x86_64.AppImage"
    "https://raw.githubusercontent.com/Molunerfinn/PicGo/dev/LICENSE"
    "picgo.png"
    "picgo.desktop"
)
sha256sums=(
    '11f68832b45eaf37a7291033ceac1a07effc9634c511edb21a83c9a4b252f9fa'
    '9cf46faad2b6b431e2fb8cc9ece7c4f2638fc04bff1089679686b7c53c8fc31e'
    '6083d735de571ecfa05448a97718676aeac8be2825d72c55a56e866c6cbba402'
    '35ef50ce57f55b4f839f7ea2666288a8208b4279b0ceb28b511463269bd25fb7'
)

package() {
    chmod +x "PicGo-${pkgver}-x86_64.AppImage"
    install -Dm755 "PicGo-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 "picgo.desktop"                    "${pkgdir}/usr/share/applications/picgo.desktop"
    install -Dm644 "picgo.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picgo.png"
}
