# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=qaxbrowser-safe-stable
pkgname=qianxin-browser-stable
pkgver=1.0.42030.7
pkgrel=2
pkgdesc="奇安信可信浏览器国密开发者专版"
arch=("x86_64")
url="https://www.qianxin.com/product/detail/pid/333"
license=('custom')
depends=(at-spi2-core libxkbcommon mesa alsa-lib gtk2 nss nspr libdrm libx11 libxshmfence libcups gcc-libs expat systemd-libs gdk-pixbuf2 \
    libxfixes libxcomposite cairo hicolor-icon-theme libxcb libxrandr glibc glib2 libxext pango libxdamage dbus)
optdepends=()
conflicts=("qianxin-browser")
provides=()
source=("${pkgname}-${pkgver}.deb::http://dl.qianxin.com/%E5%9B%BD%E5%AF%86%E5%BC%80%E5%8F%91%E8%80%85%E4%B8%93%E7%89%88/${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums=('23d2e3a3e743483bf6c69994ad3dfebe092bca0c8cbadb47b10c26f108a97e51')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}/opt/qianxin.com/qaxbrowser/product_logo_${i/x*}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${i}/apps/qaxbrowser-safe.png"
    done
}