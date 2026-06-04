# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wesm
_pkgname=msgvault
pkgname=${_pkgname}-bin
pkgdesc="Archive a lifetime of email and chat. Offline search, analytics, and AI query over your full message history. Powered by DuckDB."

pkgver=0.15.1
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
sha256sums=('e38d1744c8b7d2053b4a42dbaa926a37c720f675cee23eb85e8be33ccf12bea8'
            '6c53c20cce3570ab804556dc5ae92ca9a0dcc429b41b28c5fd0c3cc1910fe3be')
sha256sums_x86_64=('8be94ff0728850c80115e61db63bd4f027f9349e5d76d2d61ebfab806a20eabe')
sha256sums_aarch64=('77e7070e0ee8ae0c82f4d1b6c6d3d290a8f57cae9bc7b997b247194b854600b5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
