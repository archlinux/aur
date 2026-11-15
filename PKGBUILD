# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wesm
_pkgname=msgvault
pkgname=${_pkgname}-bin
pkgdesc="Archive a lifetime of email and chat. Offline search, analytics, and AI query over your full message history. Powered by DuckDB."

pkgver=0.25.0
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
sha256sums=('e5225c3968b78fa5ad0f1557d5c90a4199dd18e745ba79b199aa4aedff263f92'
            '6c53c20cce3570ab804556dc5ae92ca9a0dcc429b41b28c5fd0c3cc1910fe3be')
sha256sums_x86_64=('fe69b4826eeb115e6b126364a1d282831ffb03ce01cb74a07c61ef24ebb03b89')
sha256sums_aarch64=('4016da5abe57c918f45c172e6eb8af856393312bca8c5797e9fe604fbaf08607')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
