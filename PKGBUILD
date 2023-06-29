# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bbg-bin"
pkgver=20230505
pkgrel=1
pkgdesc="A static blog generator based on Electron Technology"
arch=('x86_64')
url="https://bbg.nekomoe.xyz/"
_githuburl="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('libdrm' 'pango' 'libxrandr' 'nss' 'libx11' 'at-spi2-core' 'libxfixes' 'libcups' 'gcc-libs' 'glibc' 'libxcb' 'gtk3' 'dbus' \
    'libxcomposite' 'nspr' 'alsa-lib' 'libxext' 'cairo' 'hicolor-icon-theme' 'glib2' 'libxdamage' 'libxkbcommon' 'mesa' 'expat')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb")
sha256sums=('f6dfe8dae1d0369ac6857dcc51917a1a57b1d96ee85c386ac3dd250de4e640c9')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/Baiyuanneko's Blog Generator/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}