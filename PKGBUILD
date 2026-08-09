# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wesm
_pkgname=msgvault
pkgname=${_pkgname}-bin
pkgdesc="Archive a lifetime of email and chat. Offline search, analytics, and AI query over your full message history. Powered by DuckDB."

pkgver=0.19.3
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
sha256sums=('b071dc9243a856e8be47770e8981f458634d522f1720b67d3fa4fc267457a4a4'
            '6c53c20cce3570ab804556dc5ae92ca9a0dcc429b41b28c5fd0c3cc1910fe3be')
sha256sums_x86_64=('bc5e804b96fd6f2aa90e48894e1022ff330708e2ebeda2a74fb6e3e3968242e6')
sha256sums_aarch64=('5812a0278fbf5e24c99ef7e750a67904562a306451ae9902f1a6b82ddc7405fd')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
