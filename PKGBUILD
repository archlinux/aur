# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gmail-desktop-bin
pkgver=3.0.0.alpha.35
_appver=3.0.0-alpha.35
pkgrel=1
pkgdesc="Nifty Gmail desktop app (nnofficial)"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=('nspr' 'cairo' 'hicolor-icon-theme' 'at-spi2-core' 'libx11' 'libdrm' 'dbus' 'libxshmfence' 'mesa' 'expat' 'gcc-libs' \
    'libxcb' 'glib2' 'alsa-lib' 'libxkbcommon' 'gdk-pixbuf2' 'pango' 'libxcomposite' 'libcups' 'libxext' 'nss' 'glibc' \
    'libxrandr' 'gtk3' 'libxdamage' 'libxfixes')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${_appver}/${pkgname%-bin}-${_appver}-linux.deb"
    "LICENSE::https://raw.githubusercontent.com/timche/gmail-desktop/main/LICENSE")
sha256sums=('97593de5044a274029dd07fb07cc52647605b030f9fab74a6f0f43db1e7c0ad1'
            '056c7c1e5bf66eba0167d966d192c743f6b66ed854011c9b6dac04f959f8f5b5')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}