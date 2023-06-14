# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="clamav-desktop-bin"
pkgver=0.3.24
pkgrel=1
pkgdesc="Cross-platform Desktop GUI for ClamAV antivirus."
arch=('x86_64')
url="https://github.com/ivangabriele/clamav-desktop"
license=('AGPL3')
depends=('gcc-libs' 'expat' 'libx11' 'nss' 'cairo' 'libxext' 'glib2' 'libxcomposite' 'glibc' 'libxrandr' 'libxfixes' 'pango' 'alsa-lib' \
    'libcups' 'gdk-pixbuf2' 'mesa' 'libxkbcommon' 'libdrm' 'gtk3' 'libxcb' 'libxdamage' 'nspr' 'hicolor-icon-theme' 'dbus' 'at-spi2-core')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.linux.amd64.deb")
sha256sums=('c1bc5128d3c1c678347418ef195a81197e53af05157cb57d247f9f396078d568')
  
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/usr/share/icons/hicolor/0x0" "${pkgdir}/usr/share/icons/hicolor/512x512"
}