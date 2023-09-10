# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=line-by-line-bin
pkgver=0.3.6
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
sha256sums=('d7938bf4d20977f3314ec9b6eba0f91cf7136ad7ae30e82186ee22385d3066d8')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}