# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altair-bin
pkgver=5.0.28
pkgrel=1
pkgdesc="A beautiful feature-rich GraphQL Client for all platforms."
arch=('x86_64')
url="https://altairgraphql.dev/"
_githuburl="https://github.com/altair-graphql/altair"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glibc' 'hicolor-icon-theme' 'libxkbcommon' 'pango' 'libxfixes' 'libcups' 'libxcb' 'libx11' 'nss' 'expat' 'gcc-libs' \
    'nspr' 'libdrm' 'gtk3' 'at-spi2-core' 'dbus' 'cairo' 'libxrandr' 'libxcomposite' 'mesa' 'libxdamage' 'glib2' 'libxext' 'alsa-lib')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64_linux.deb")
sha256sums=('58e73a836bb49dbdaf9f2b0b004ebbb9e5cf1ca2d22bf963630a784205194aac')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/Altair GraphQL Client/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}