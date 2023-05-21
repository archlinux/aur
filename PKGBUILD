# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="jimud-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="MUD client for ShadowMUD.com, based on webclient"
arch=("x86_64")
url="http://www.shadowmud.com/"
_githuburl="https://github.com/icewolfz/jiMUD"
license=('custom')
depends=('hicolor-icon-theme' 'glibc' 'nss' 'libdrm' 'libx11' 'libcups' 'nspr' 'libxkbcommon' 'pango' 'mesa' 'libxext' 'alsa-lib' \
    'glib2' 'at-spi2-core' 'expat' 'libxdamage' 'gcc-libs' 'wayland' 'libxcb' 'cairo' 'libxcomposite' 'gtk3' 'dbus' 'libxfixes' 'libxrandr')
    options=(!strip)
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.rpm::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${arch}.rpm")
sha256sums=('9583babf6bf48d66a36d679ee71b53b4dd886c71d5f8b38e3763311f7c955303')

package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    rm -rf "${pkgdir}/usr/lib"
    install -Dm644 "${pkgdir}/opt/jiMUD/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}