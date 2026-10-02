# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wesm
_pkgname=msgvault
pkgname=${_pkgname}-bin
pkgdesc="Archive a lifetime of email and chat. Offline search, analytics, and AI query over your full message history. Powered by DuckDB."

pkgver=0.21.0
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
sha256sums=('1b2aa5259c158b18d2162df2fb4c14dbadc9205654bc5326ac1be72a5b74726e'
            '6c53c20cce3570ab804556dc5ae92ca9a0dcc429b41b28c5fd0c3cc1910fe3be')
sha256sums_x86_64=('56b2438eab14f3cadd15b6edecc4ea30454b6584c1039c2d5593a0afa77d7497')
sha256sums_aarch64=('48720a42f2b7340480d32c6622c0d372a2e894ce90f2a4f7be025c77ccb40512')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
