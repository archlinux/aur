# Maintainer: so1ar <so1ar114514@gmail.com>
# Maintainer: Baron Hou <houbaron@gmail.com>


pkgname=picgo-appimage
_ver=2.4.0
_beta=beta.3
pkgver=${_ver}${_beta}
_release=${_ver}-${_beta}
#_release=${_ver}
pkgrel=1
epoch=1

pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue"
arch=('x86_64')
url="https://molunerfinn.com/PicGo/"
license=('MIT')
noextract=("PicGo-${_release}.AppImage")
options=("!strip")
source=(
    "https://github.com/Molunerfinn/PicGo/releases/download/v${_release}/PicGo-${_release}.AppImage"
    "https://raw.githubusercontent.com/Molunerfinn/PicGo/dev/LICENSE"
    "picgo.png"
    "picgo.desktop"
)
sha256sums=(
    '5a81b0ae607127893732be79233b456298514c6c41dd7a01efa502b11bff50ba'
    '9cf46faad2b6b431e2fb8cc9ece7c4f2638fc04bff1089679686b7c53c8fc31e'
    'SKIP'
    'SKIP'
)

package() {
    install -Dm755 "PicGo-${_release}.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 "picgo.desktop"                    "${pkgdir}/usr/share/applications/picgo.desktop"
    install -Dm644 "picgo.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picgo.png"
}
