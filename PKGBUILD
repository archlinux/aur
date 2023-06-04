# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fvc-bin"
pkgver=2.3.2
pkgrel=1
pkgdesc="File Version Control (FVC) is a tool designed to give automated version control abilities (similar to Git) to those working with binary and media files, where traditional version control is not possible. "
arch=('x86_64')
url="https://github.com/PrismLabsDev/fvc-desktop-electron"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('libxcomposite' 'libxshmfence' 'libxcb' 'libxdamage' 'hicolor-icon-theme' 'libcups' 'libxrandr' 'gdk-pixbuf2' 'libxfixes' 'nss' \
    'mesa' 'expat' 'libxext' 'glib2' 'libx11' 'alsa-lib' 'gtk3' 'dbus' 'gcc-libs' 'at-spi2-core' 'cairo' 'glibc' 'libxkbcommon' 'libdrm' \
    'nspr' 'pango')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb.zip")
sha256sums=('f79bbc33c6e8d8ffa92d903a9c401d15cdabd9128f237249dd8d2275abb54368')
  
package() {
    ar -x "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}