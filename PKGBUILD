# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xraygui-bin
pkgver=1.4
pkgrel=1
pkgdesc="A small and nimble GUI for XRay"
arch=('x86_64')
url="https://github.com/AKotov-dev/XRayGUI"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('gtk2' 'zenity' 'p7zip' 'wget' 'fping' 'systemd')
optdepends=('glibc' 'glib2' 'gdk-pixbuf2' 'libx11' 'cairo' 'pango' 'at-spi2-core' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx9_amd64.deb")
sha256sums=('cbc69a975e4948050b48732021981e9d282fb6ef2b39cda569d1c74782aea2af')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    mv "${pkgdir}/usr/share/${pkgname%-bin}/lib/${CARCH}-linux/"* "${pkgdir}/usr/share/${pkgname%-bin}/lib/"
    rm -rf "${pkgdir}/usr/share/${pkgname%-bin}/lib/${CARCH}-linux"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}