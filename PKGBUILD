# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Bhavesh164
_pkgname=docker-tui
pkgname=${_pkgname}-bin
pkgdesc="Docker terminal UI"

pkgver=0.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Unlicense')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('11237f568a9fa92cd46957721fc6b84ab790d1b60e9163c0c2e9b49af11ea5aa')
sha256sums_x86_64=('dd6361be00486ff9a7bc95ef5e0e5a07a324d05b4ee5a01d6aabf99fe604eb40')
sha256sums_aarch64=('28fa77a38aed8e139b0b63f1f4ca9bce64c73b05cfd61da9b64694616067130b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
