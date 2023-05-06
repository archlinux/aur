# Maintainer: so1ar <so1ar114514@gmail.com>
# Maintainer: Baron Hou <houbaron@gmail.com>


pkgname=picgo-appimage
_ver=2.4.0
_beta=beta.1
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
    'cec480d79c9fc26f5f7e7e5abba213a62c308dba973259d586c2b01c0e52fbec'
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
