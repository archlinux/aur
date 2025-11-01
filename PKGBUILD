# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pashkov256
_pkgname=deletor
pkgname=${_pkgname}-bin
pkgver=1.5.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Manage and delete files efficiently with an interactive TUI and scriptable CLI"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[2]}")
sha256sums=('94358cdafa825e27dbac87bafb10fe4805fcec387d8c587554fe6fcb85bb14e0'
            '41ecc03e20f85a2e4f7dd47754c7509607005132f05f540ed2872f5d7eaef990')
sha256sums_x86_64=('557f43ee75e70728c62f3fd13ac13c946bb58bfe9a2986ff394bd8c9e45c8ddb')
sha256sums_i686=('bc4fd205039c330e954ec1d5b5ae0aa5b55c3027a6069f1159f5da8c86f0a19b')
sha256sums_aarch64=('ad01df77af56b8326951c2d29ee193b58a17044a518dac406318f32f290c3427')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
