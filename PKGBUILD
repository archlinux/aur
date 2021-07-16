# Maintainer: Nyaacinth <nyaacinth_liota@outlook.com>
pkgname=libresprite-appimage
pkgdesc="fork of last GPL version of aseprite - appimage version"
pkgver="1.0.dev"
pkgrel=1
_commit="4fc8d5370db0ed7ecad70182b97171a717de7817"
arch=('x86_64')
url="https://github.com/LibreSprite/LibreSprite"
license=('GPL2')
options=(!strip)
source_x86_64=(
"libresprite::${url}/releases/download/continuous/LibreSprite-$(echo ${_commit}|cut -b 1-7)-x86_64.AppImage"
)
source=(
"16x16.png::${url}/raw/${_commit}/desktop/icons/hicolor/16x16/libresprite.png"
"32x32.png::${url}/raw/${_commit}/desktop/icons/hicolor/32x32/libresprite.png"
"48x48.png::${url}/raw/${_commit}/desktop/icons/hicolor/48x48/libresprite.png"
"64x64.png::${url}/raw/${_commit}/desktop/icons/hicolor/64x64/libresprite.png"
"256x256.png::${url}/raw/${_commit}/desktop/icons/hicolor/256x256/apps/libresprite.png"
"libresprite.desktop::${url}/raw/${_commit}/desktop/libresprite.desktop"
)
noextract=('libresprite')
sha256sums_x86_64=(
'3dabef5da5c2ef4477730803774e802f1b0b3d8922b31d8d4d12595655276117'
)
sha256sums=(
'b444bf24719ecf0af475856a742ccdacd1ed13181c7a589d882ae881579e0f28'
'124dd7417dd1367caa086e992be3c7f4cc8fa14b03918b244702a33f1f1826ac'
'50541083b35d16a50a998b675c37b8f7db318a0bd3f103202115eacaad277edf'
'8148be0319c8a501703df96fa4f79f46cecdddc3443f7fdb5d6499c69703cec4'
'c056ba818a7ed7731edecbbca52bb861857b81e5db58ba6ec078e88d6ff36bfa'
'aa78be3e501988a0cf24a1a5464d7e7a1d211d0a18ee18e4e1d201251169845c'
)

provides=('libresprite')

prepare() {
    chmod +x libresprite
}

package() {
    install -Dm755 "${srcdir}/libresprite" "${pkgdir}/usr/bin/libresprite"
    install -Dm644 "${srcdir}/16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/libresprite.png"
    install -Dm644 "${srcdir}/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/libresprite.png"
    install -Dm644 "${srcdir}/48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/libresprite.png"
    install -Dm644 "${srcdir}/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/libresprite.png"
    install -Dm644 "${srcdir}/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/libresprite.png"
    install -Dm755 "${srcdir}/libresprite.desktop" "${pkgdir}/usr/share/applications/libresprite.desktop"
}
