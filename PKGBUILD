# Maintainer: so1ar <so1ar114514@gmail.com>
# Maintainer: Baron Hou <houbaron@gmail.com>


pkgname=picgo-appimage
pkgver=2.3.0
#_betaver=beta.8
pkgrel=2

pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64')
url="https://molunerfinn.com/PicGo/"
license=('MIT')
noextract=("PicGo-${pkgver}.AppImage")
options=("!strip")
source=(
    "https://github.com/Molunerfinn/PicGo/releases/download/v${pkgver}/PicGo-${pkgver}.AppImage"
    "https://raw.githubusercontent.com/Molunerfinn/PicGo/dev/LICENSE"
    "picgo.png"
    "picgo.desktop"
)
sha256sums=(
    'f56286f5e3702b759b95dd635737596e5fb4ef33874438bc259d43b7729080b3'
    '9cf46faad2b6b431e2fb8cc9ece7c4f2638fc04bff1089679686b7c53c8fc31e'
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "PicGo-${pkgver}.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    #install -Dm755 "PicGo-${pkgver}-${_betaver}.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 "picgo.desktop"                    "${pkgdir}/usr/share/applications/picgo.desktop"
    install -Dm644 "picgo.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picgo.png"
}
