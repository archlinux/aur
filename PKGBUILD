# Maintainer: Patryk Kurdziel <patryk.kurdziel@protonmail.com>

_pkgname=spek-rs
pkgname="${_pkgname}-bin"
pkgver=0.1.0
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
sha512sums=('e7b983d1bd75c9fbfada01e47607c9fd3e48b4b5643ad602dcf9cd794c864ac750ce06baac439703e0db430aa262c4c807a6e19f66a1ccbcc1bf98985a03a59c'
            '867cd03d4886ebc852efa272e4d4a7923a3d50249f0e1c629a862a4a7531241b59063269bb53b7e8fc7ec2bd9a71457ead3de64f20eb7749d9aaf3e91bd32eed'
            'c9723f88751e7f8017d6f1e45ffc79db68816be98c385728dcee2b45bd6e178f0a6fc42ebceb794b238df93bce9ca81633bdf92e7d01a0f4943b6aa0a59f5ffa'
            '958949735e9c09b4111851ea918a539876c129a68a41a2037715a557affd43d13b82181e43ed99e783309f7e3886310c9c396baca993bc742d82fde8b2b0a45e')

package() {
	install -Dm755 "${_pkgname}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}-v${pkgver}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${_pkgname}-v${pkgver}-icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
