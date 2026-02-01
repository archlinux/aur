# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

_pkgname=spek-rs
pkgname="${_pkgname}-bin"
pkgver=0.2.0
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
sha512sums=('1ea591f82722e9cc9959b1498ba90598b166a2eb180c08fb4e03071006469ca29bcd651874e7af2ed1496abc4ff06c07f2f7b3233e6c857d980d817099968243'
            '4a00ba02a6a836bfa7ac375a52ad084b40cef78ef89eead750694ec0c4aa4cca5620451ea58930693478a3b3b61acace627d9fbd1253800eeaff003de21bc313'
            'c9723f88751e7f8017d6f1e45ffc79db68816be98c385728dcee2b45bd6e178f0a6fc42ebceb794b238df93bce9ca81633bdf92e7d01a0f4943b6aa0a59f5ffa'
            '958949735e9c09b4111851ea918a539876c129a68a41a2037715a557affd43d13b82181e43ed99e783309f7e3886310c9c396baca993bc742d82fde8b2b0a45e')

package() {
	install -Dm755 "${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-v${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${_pkgname}-v${pkgver}-icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
