# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
pkgname=stapxs-qq-lite-bin
_pkgname='Stapxs QQ Lite'
pkgver=3.2.1
pkgrel=1
epoch=
pkgdesc="A compatible OneBot protocol unofficial version of the web QQ client, electron client.(Prebuilt version)一个兼容 oicq-http 的非官方网页版 QQ 客户端, 使用 Vue 重制的全新版本."
arch=(
    'aarch64'
    'x86_64'
)
url="https://stapxs.github.io/Stapxs-QQ-Lite-2.0/"
_ghurl="https://github.com/Stapxs/Stapxs-QQ-Lite-2.0"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}_${pkgver}_amd64.deb")
sha256sums_aarch64=('5650acb56ca0cde5b0cbba56441e991100083ddb3bd029689fcab913c9302e16')
sha256sums_x86_64=('de5296e28edb561248f6a69ec53736ff47d828f135c520b06f24217ba533bbdb')
prepare() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/648x648/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
