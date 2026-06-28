# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=JayanAXHF
_pkgname=gitv
pkgname=${_pkgname}-bin
pkgdesc="A terminal-based viewer for GitHub issues"

pkgver=0.4.5
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
sha256sums_x86_64=('c86f06a3f13756e74b338061578e9644014c9c562a80699ee0cb3b6423279ef9')
sha256sums_aarch64=('54ea2241475430ff7b1cda4f6f96891614a54417b390f2bf5761a3805644a64a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
