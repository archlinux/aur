# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-youtube-music-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal electron app for Youtube Music"
arch=('x86_64')
url="https://github.com/pauchiner/electron-youtube-music"
license=('custom')
depends=('nss' 'cairo' 'hicolor-icon-theme' 'at-spi2-core' 'libxcb' 'mesa' 'libxdamage' 'libxfixes' 'gcc-libs' 'pango' 'libcups' \
    'expat' 'gtk3' 'libx11' 'libxrandr' 'libdrm' 'dbus' 'nspr' 'libxkbcommon' 'libxext' 'glib2' 'alsa-lib' 'glibc' 'libxcomposite')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Linux.deb")
sha256sums=('7f12ca29771515ff0735af72b639d7c1bb609e14b7dd69d506e65a11a03c1cc3')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt//Youtube Music/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}