# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="flaru-player-bin"
pkgver=1.12.0
pkgrel=1
pkgdesc="An "unofficial" emulator based on Ruffle Flash Emulator. Created to provide a friendly interface and enhanced playing experience. It's a complete alternative to Adobe Flash Player. Run Flash Safely Anywhere"
arch=('x86_64')
url="https://github.com/jooy2/flaru"
license=(custom)
depends=('cairo' 'nspr' 'nss' 'libcups' 'gtk3' 'libxfixes' 'libx11' 'gcc-libs' 'libxcomposite' 'libxdamage' 'libxrandr' 'expat' \
    'libxcb' 'libxkbcommon' 'hicolor-icon-theme' 'glib2' 'libxext' 'pango' 'mesa' 'at-spi2-core' 'dbus' 'alsa-lib' 'glibc' 'libdrm')
options=(!strip)
conflicts=("${pkgname%-player-bin}-appimage" "${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/Flaru.Player.${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/jooy2/flaru/master/LICENSE")
sha256sums=('986db046e5e073877f6d43d62045b753d2a902ddcbda3328bdc9d3f6745aa065'
            '22f86a10f95ec7f4695c4d39a1df4464a6d61d7fe457dcd9181d71d530b0b70a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --uname root --gname root
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}