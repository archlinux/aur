# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Ooooze
_pkgname=batctl
pkgname=${_pkgname}-tui-bin
pkgdesc="TUI and CLI tool for managing battery charge thresholds on Linux laptops"

pkgver=2026.3.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}-tui")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('04e57bd3e7164f66c9d351879eba829498f85a4e790d058aa106bc5244c895c0'
            '48fc4ed0c9295d3785a935cb975db515b89a8c1a2832567fa87d257309917ce3')
sha256sums_x86_64=('3904eb3313c07cb4b23f95e8e0741a14eabdc8f9b23e1a9c6792d0dceb14b254')
sha256sums_aarch64=('920486392985a7bb389951a6d634eb6d635f73749e59dae365d106146b611267')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
