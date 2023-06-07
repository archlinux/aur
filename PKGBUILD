# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="glimboi-bin"
pkgver=2.7.6
pkgrel=1
pkgdesc="A chatbot for Glimesh.tv"
arch=("x86_64")
url="https://glimboi.com/"
_githuburl="https://github.com/aMytho/GlimBoi"
license=('MIT')
depends=('at-spi2-core' 'dbus' 'libxrandr' 'glib2' 'libxcomposite' 'cairo' 'libxfixes' 'gcc-libs' 'expat' 'libxdamage' 'pango' 'libcups' \
    'libxcb' 'gdk-pixbuf2' 'nss' 'gtk3' 'libxkbcommon' 'libxext' 'glibc' 'libdrm' 'mesa' 'hicolor-icon-theme' 'alsa-lib' 'libx11' 'nspr')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/aMytho/GlimBoi/main/LICENSE")
sha256sums=('69006428124c19401c663a1848a6e0c1190e4f778641ceab2bb63de41092cef6'
            '0a1fcb16cfedd24007679bc30fc10294f89a479a466adb1a2a0aa77f63dfc755')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}