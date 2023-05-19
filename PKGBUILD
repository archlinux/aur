# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="projscope-music-player-bin"
pkgver=0.0.3
pkgrel=1
pkgdesc="Projscope MP3 player is free desktop, cross platform tool (Winamp you are remembered)!"
arch=("x86_64")
url="https://projscope.com/"
_githuburl="https://github.com/jviaches/projscope-music-player"
license=('MIT')
depends=('dbus' 'gtk3' 'libx11' 'gdk-pixbuf2' 'glibc' 'nss' 'nodejs' 'mesa' 'nspr' 'libxrandr' 'libxcb' 'expat' 'pango' 'at-spi2-core' 'libdrm' \
    'glib2' 'libcups' 'alsa-lib' 'libxdamage' 'libxcomposite' 'libxext' 'cairo' 'gcc-libs' 'hicolor-icon-theme' 'libxfixes' 'libxkbcommon')
conflicts=("${pkgname%-bin}")
noextract=()
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.rpm::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-0.0.1.${arch}.rpm"
    "LICENSE::https://raw.githubusercontent.com/jviaches/projscope-music-player/main/LICENSE")
sha256sums=('79493043f2ab40b625fe2f8e936cdc5779a5a86e15d458cde4709e92e12881e5'
            '1aa2a3326e734bc2595f638283ed58576d5358bf403f228b48d275b98abe1f3c')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}