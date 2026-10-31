# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nasedkinpv
_pkgname=numr
pkgname=${_pkgname}-bin
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"

pkgver=0.9.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')
provides=("${_pkgname}" "${_pkgname}-cli")

source=("EXAMPLE_1-${pkgver}.numr::${_urlraw}/compound_units.numr"
		"EXAMPLE_2-${pkgver}.numr::${_urlraw}/example.numr"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('7851847b55641a91669dd13de53acadab3c574d7ae2161247942ca0a2ed84044'
            '06fc42628c1b79425dea3e8941ccda9e006159ddcb7a23dae8b616247060d958'
            '30bfe0d0553231aed0458c83c640f09d83e41173d96dfd8542ed5725f6b6fb6b'
            'd606ed9e171d1b6c0fc38573e5509c4b70d9df40c8a736c78455382c7559ea2b')
sha256sums_x86_64=('ebf9cd7211b0fd714c11f6127d635a6f2ddfc8ddcb453053791d7eac8efbf820')
sha256sums_aarch64=('0c00ba559d29dc2ea25b698ad85bc3bc7490bae3cd264f7da2218b064900a7e8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"

	install -Dm644 "EXAMPLE_1-${pkgver}.numr" "${pkgdir}/usr/share/doc/${pkgname}/examples/compound_units.numr"
	install -Dm644 "EXAMPLE_2-${pkgver}.numr" "${pkgdir}/usr/share/doc/${pkgname}/examples/example.numr"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
