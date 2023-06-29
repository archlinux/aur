# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="positron-bin"
pkgver=0.0.3
pkgrel=1
pkgdesc="Desktop application that allows you to manage your movie and show watchlist. It is built using Electron and React."
arch=('x86_64')
url="https://github.com/arjunindia/positron"
license=("custom")
depends=('libx11' 'libxrandr' 'glib2' 'libdrm' 'glibc' 'gcc-libs' 'pango' 'nss' 'expat' 'libxkbcommon' 'libxext' 'cairo' 'mesa' 'libxcb' \
    'alsa-lib' 'at-spi2-core' 'nspr' 'dbus' 'hicolor-icon-theme' 'libxfixes' 'libcups' 'libxdamage' 'gtk3' 'libxcomposite')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_1.0.0_amd64.deb")
sha256sums=('55ae50a9e37c51c459186886fe2651e0aa17ddbd52cea69651f7c618ff71fe46')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}