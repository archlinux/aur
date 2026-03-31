# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=JayanAXHF
_pkgname=gitv
pkgname=${_pkgname}-bin
pkgdesc="A terminal-based viewer for GitHub issues"

pkgver=0.4.2
pkgrel=1
_pkgvername=gitv-tui-v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE-MIT")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('29a3ccf767afca6f642e0443f5a5ff56fcee3270981be4aa8ca806976cd552ab'
            'a200714fe406a47e3884b5ecbd250df63d8687399ba8f0f10f50f32d384c673a')
sha256sums_x86_64=('9a90158bbbe7bb5fd3d728dfa02b289178f5c8974af464e049292b14cb180064')
sha256sums_aarch64=('642d041e9ac1745bc78e9546ba7eefc6a1370a6a1659288cb3604aea0613a389')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
