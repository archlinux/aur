# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=qaxbrowser-safe-stable
pkgname=qianxin-browser-stable
pkgver=1.0.45304.7
pkgrel=1
pkgdesc="奇安信可信浏览器国密开发者专版"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://www.qianxin.com/product/detail/pid/333"
_downloadurl="https://dl.qianxin.com/%E5%9B%BD%E5%AF%86%E5%BC%80%E5%8F%91%E8%80%85%E4%B8%93%E7%89%88-230809"
license=('custom')
depends=('at-spi2-core' 'libx11' 'systemd-libs' 'gdk-pixbuf2' 'mesa' 'libxrandr' 'hicolor-icon-theme' 'libxkbcommon' 'libdrm' 'libxext' 'libxshmfence' \
    'cairo' 'libcups' 'nss' 'dbus' 'alsa-lib' 'libxfixes' 'libxcb' 'gtk2' 'glibc' 'expat' 'libxcomposite' 'libxdamage' 'pango' 'nspr' 'gcc-libs' 'sh' 'glib2')
conflicts=("${pkgname%-stable}" "${_pkgname%-stable}" "${_pkgname%-safe-stable}")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_downloadurl}/${_pkgname}_${pkgver}-1_arm64.deb")
source_armv7h=("${pkgname}-${pkgver}-armv7h.deb::${_downloadurl}/${_pkgname}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_downloadurl}/${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums_aarch64=('cb56c5e1d2bb474f0468b69859945b1f7e76f8ce6d3e1602afe8c1ece8ac36b1')
sha256sums_armv7h=('cb56c5e1d2bb474f0468b69859945b1f7e76f8ce6d3e1602afe8c1ece8ac36b1')
sha256sums_x86_64=('5ca46c571075016bf87745d5f74fec69e4f343c6bf485faeb21b4109e0df3065')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}/opt/${pkgname%-browser-stable}.com/${_pkgname%-safe-stable}/product_logo_${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname%-stable}.png"
    done
}