# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

_pkgname=spek-rs
pkgname="${_pkgname}-bin"
pkgver=0.3.3
pkgrel=1
pkgdesc='Acoustic spectrum analyser. Spek alternative written in Rust.'
url="https://github.com/patryk-ku/${_pkgname}"
license=('MIT')
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('ffmpeg')
source=("${_pkgname}-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}"
	"${_pkgname}-v${pkgver}.desktop::https://raw.githubusercontent.com/patryk-ku/${_pkgname}/refs/tags/v${pkgver}/packaging/spek-rs.desktop"
	"${_pkgname}-v${pkgver}-icon.png::https://raw.githubusercontent.com/patryk-ku/${_pkgname}/refs/tags/v${pkgver}/assets/icon.png"
	"LICENSE-v${pkgver}::https://raw.githubusercontent.com/patryk-ku/${_pkgname}/refs/tags/v${pkgver}/LICENSE")
sha512sums=('6b02cb707e87c52e1d312d5f02417b6be0a75601a158ba7e8d11b2a61c70bf2ab68cd79b03ebf80d985bafc0435f64d261d8015b3de329eda6c381a326fc5c2c'
            '4a00ba02a6a836bfa7ac375a52ad084b40cef78ef89eead750694ec0c4aa4cca5620451ea58930693478a3b3b61acace627d9fbd1253800eeaff003de21bc313'
            'c9723f88751e7f8017d6f1e45ffc79db68816be98c385728dcee2b45bd6e178f0a6fc42ebceb794b238df93bce9ca81633bdf92e7d01a0f4943b6aa0a59f5ffa'
            '194d6d61854a69b72f7cd6901cc1ab4504068bb2cc95abba9661f3bc42dd25de20eb70259c9b1b65bc03d6f207ee44fa45ed0cda699c0dc4dd5d7c4f53bed840')

package() {
	install -Dm755 "${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-v${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${_pkgname}-v${pkgver}-icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
