# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=pashkov256
_pkgname=deletor
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Manage and delete files efficiently with an interactive TUI and scriptable CLI"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[2]}")
sha256sums=('94358cdafa825e27dbac87bafb10fe4805fcec387d8c587554fe6fcb85bb14e0'
            'e00a7f42fd4cfb1696698598ea0b20976d41e1c8d48c54d80892d2944c34c667')
sha256sums_x86_64=('f2b68d76f2490ad35172c7513e7626445b7302b02db19fb2e6507874883ba199')
sha256sums_i686=('b28f06c46422a452050f02338aaeafdc2423b02d61e9c222de58b87908188dab')
sha256sums_aarch64=('da6eb67f5f7de05ab9cd688067f3c4fc8945ffdc266017cf62735bdd8e9b5dc7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
