# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=nasedkinpv
_pkgname=numr
pkgname=${_pkgname}-bin
pkgdesc="A text calculator for natural language expressions with a vim-style TUI"

pkgver=0.9.3
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
            'f36c44d7a01f4969115c8dee0dd16bc867e25f0847de46cf1cb956995f11b499'
            'd606ed9e171d1b6c0fc38573e5509c4b70d9df40c8a736c78455382c7559ea2b')
sha256sums_x86_64=('e1080b946fc34097023f5a4578d980fd839d964a83c4bf4108c327e29c4ed14b')
sha256sums_aarch64=('69f3744907847f4e1882f47bf16dc8f17f2292762bc505f6184aa7edf00d2f4e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"

	install -Dm644 "EXAMPLE_1-${pkgver}.numr" "${pkgdir}/usr/share/doc/${pkgname}/examples/compound_units.numr"
	install -Dm644 "EXAMPLE_2-${pkgver}.numr" "${pkgdir}/usr/share/doc/${pkgname}/examples/example.numr"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
