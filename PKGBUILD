# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=qaxbrowser-safe-stable
pkgname=qianxin-browser-stable
pkgver=1.0.42030.7
pkgrel=3
pkgdesc="奇安信可信浏览器国密开发者专版"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://www.qianxin.com/product/detail/pid/333"
license=('custom')
depends=('at-spi2-core' 'libx11' 'systemd-libs' 'gdk-pixbuf2' 'mesa' 'libxrandr' 'hicolor-icon-theme' 'libxkbcommon' 'libdrm' 'libxext' 'libxshmfence' \
    'cairo' 'libcups' 'nss' 'dbus' 'alsa-lib' 'libxfixes' 'libxcb' 'gtk2' 'glibc' 'expat' 'libxcomposite' 'libxdamage' 'pango' 'nspr' 'gcc-libs' 'sh' 'glib2')
conflicts=("${pkgname%-stable}" "${_pkgname%-stable}")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::http://dl.qianxin.com/%E5%9B%BD%E5%AF%86%E5%BC%80%E5%8F%91%E8%80%85%E4%B8%93%E7%89%88/${_pkgname}_${pkgver}-1_arm64.deb")
source_armv7h=("${pkgname}-${pkgver}-armv7h.deb::http://dl.qianxin.com/%E5%9B%BD%E5%AF%86%E5%BC%80%E5%8F%91%E8%80%85%E4%B8%93%E7%89%88/${_pkgname}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::http://dl.qianxin.com/%E5%9B%BD%E5%AF%86%E5%BC%80%E5%8F%91%E8%80%85%E4%B8%93%E7%89%88/${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums_aarch64=('7d9c1bc965bebecfbcfe6c5ff4a3faa8309c300e26b032b6a2f09dc2e785a33f')
sha256sums_armv7h=('7d9c1bc965bebecfbcfe6c5ff4a3faa8309c300e26b032b6a2f09dc2e785a33f')
sha256sums_x86_64=('23d2e3a3e743483bf6c69994ad3dfebe092bca0c8cbadb47b10c26f108a97e51')
package() {
    bsdtar -xvf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}/opt/qianxin.com/qaxbrowser/product_logo_${_icons/x*}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/qaxbrowser-safe.png"
    done
}