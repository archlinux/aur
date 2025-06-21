# Maintainer: Menghuan1918 <menghuan2003 at outlook dot com>
# Contributor: so1ar <so1ar114514@gmail.com>
# Contributor: Baron Hou <houbaron@gmail.com>


pkgname=picgo-appimage
_ver=2.4.0
_beta=beta.10
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
    'fcaeb53510f56f67d6b9ed9235692cca4c289c6f72ebb04ea172c0fe268059a7'
    '9cf46faad2b6b431e2fb8cc9ece7c4f2638fc04bff1089679686b7c53c8fc31e'
    '6083d735de571ecfa05448a97718676aeac8be2825d72c55a56e866c6cbba402'
    '35ef50ce57f55b4f839f7ea2666288a8208b4279b0ceb28b511463269bd25fb7'
)

package() {
    chmod +x "PicGo-${_release}.AppImage"
    install -Dm755 "PicGo-${_release}.AppImage" "${pkgdir}/opt/appimages/picgo.AppImage"
    install -Dm644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 "picgo.desktop"                    "${pkgdir}/usr/share/applications/picgo.desktop"
    install -Dm644 "picgo.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picgo.png"
}
