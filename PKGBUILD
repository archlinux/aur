# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xraygui-bin"
pkgver=1.3
pkgrel=2
pkgdesc="A small and nimble GUI for XRay"
arch=('x86_64')
url="https://github.com/AKotov-dev/XRayGUI"
license=("GPL3")
conflicts=("${pkgname%-bin}")
depends=('gtk2' 'zenity' 'p7zip' 'wget' 'fping' 'systemd')
optdepends=('glibc' 'glib2' 'gdk-pixbuf2' 'libx11' 'cairo' 'pango' 'at-spi2-core' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx8_amd64.deb")
sha256sums=('f32a5940f5908f3efe34be1323b6589efa9b0f2c462d3855fb597e56fa011852')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" --gname root --uname root
    mv "${pkgdir}/usr/share/xraygui/lib/x86_64-linux/"* "${pkgdir}/usr/share/xraygui/lib/"
    rm -rf "${pkgdir}/usr/share/xraygui/lib/x86_64-linux"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}