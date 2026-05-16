# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=serkanyersen
_pkgname=dotstate
pkgname=${_pkgname}-bin
pkgdesc="A modern, secure, and user-friendly dotfile manager"

pkgver=0.3.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('7efa2e24bd29cabcff7c83ee7695a8a53701d94974a4284537be6f4f1b0020a0'
            'c679ca2e886f48ad30ce0404bdfa2db0197f4e7100de7c313a788376cef93901')
sha256sums_x86_64=('cec28e75f9d22e8af0932cd8e322823cb75d4a9fb4f78fba537a35745d3ee2ff')
sha256sums_aarch64=('5525355863a557d24eb33d7f1b9095decc628147a4c200b7ba109f16d4ef3ff0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
