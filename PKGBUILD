# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wesm
_pkgname=msgvault
pkgname=${_pkgname}-bin
pkgdesc="Archive a lifetime of email and chat. Offline search, analytics, and AI query over your full message history. Powered by DuckDB."

pkgver=0.11.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'libstdc++')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('848d9f0f92a17856742c3682bcab07d0634b4a166361cc601cbddc6a7ed602cf'
            '6c53c20cce3570ab804556dc5ae92ca9a0dcc429b41b28c5fd0c3cc1910fe3be')
sha256sums_x86_64=('fbf5bd0f66d36d6f3104175e9f1624fd6f5e672c6db208279fb7ba66f2d6dddd')
sha256sums_aarch64=('bd94a59f5d836f2c3a6dc48ddb019829d1f695fa805d4e11ac59adee66dcf7ed')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
