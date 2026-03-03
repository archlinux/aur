# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=JayanAXHF
_pkgname=gitv
pkgname=${_pkgname}-bin
pkgdesc="A terminal-based viewer for GitHub issues"

pkgver=0.3.2
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
sha256sums=('72377fa9861d71d85733fab133fcd7422668b715c8b57e65ff7803a123bd0ea3'
            'a200714fe406a47e3884b5ecbd250df63d8687399ba8f0f10f50f32d384c673a')
sha256sums_x86_64=('69de0f5e5afdaeaa88cf626d686505ca992634be78e2a8e6624459baab8f0b8e')
sha256sums_aarch64=('f8122eda22895a83c10d5f345f43925c8fc69374dce700555a4997def7c633a8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
