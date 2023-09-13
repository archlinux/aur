# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=line-by-line-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Modern markdown editor application with built-in ChatGPT extension."
arch=("x86_64")
url="https://linebyline-group.vercel.app/"
_githuburl="https://github.com/linebyline-group/linebyline"
license=("AGPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'gdk-pixbuf2' 'libsoup' 'gcc-libs' 'gtk3' 'webkit2gtk' 'glibc' 'glib2' 'pango')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('f311024d92313eb903d36c8d7f8c832819b27f4c7d16580393054270ce8caa78')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}