# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mini-music-bin"
pkgver=1.5.0
pkgrel=2
pkgdesc="A simple and beautiful music player.一个简单、美观的音乐播放器"
arch=('x86_64')
url="https://gitee.com/cgper/miniMusic"
_githuburl="https://github.com/CGPer/miniMusic"
license=('MulanPSL2')
depends=('gtk3' 'glibc' 'gcc-libs' 'libdrm' 'hicolor-icon-theme' 'libx11' 'mesa' 'nss' 'dbus' 'libxcb' 'libxkbcommon' \
    'at-spi2-core' 'libxdamage' 'libcups' 'expat' 'libxcomposite' 'libxext' 'pango' 'gdk-pixbuf2' 'alsa-lib' 'libxfixes' \
    'nspr' 'libxrandr' 'cairo' 'glib2')
provides=("cgper")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('f451f4e717c9364e8e302e9f24e2f7a8a0573734508d96b1c48b3ff548d5b310'
            'd0b16a3cb603569486834cb55fa8a539832063864793339386f5e1f646928987')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/迷你音乐" "${pkgdir}/opt/${pkgname%-bin}"
    sed 's|/opt/迷你音乐|/opt/mini-music|g;s|DesktopApp|AudioVideo|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}" 
}