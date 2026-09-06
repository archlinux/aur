# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wcampbell0x2a
_pkgname=backhand
pkgname=${_pkgname}-bin
pkgver=0.25.3
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Read, create and modify SquashFS File Systems"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0' 'MIT')

conflicts=("${_pkgname}")
provides=('add-backhand' 'replace-backhand' 'unsquashfs-backhand')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('2b7cadc5845c3f38dd5199b3cf225c8eae068f39e8e52be6a69b8836cbcbfc05'
            '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3'
            'fd26644b0118c8ae84a8770bdbbe18f7db14387b5cc19d1de670ad2d98a7ad42')
sha256sums_x86_64=('7442d255c22c19a0c1ef501b85cbaa25f003f5a967d0ad312b1660c6af1f966e')
sha256sums_aarch64=('4b617a85c07ee20fa7fefffe435288c960992e0e428369a3ebbccbaebe822f46')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${provides[0]}" "${pkgdir}/usr/bin/${provides[0]}"
	install -Dm755 "${provides[1]}" "${pkgdir}/usr/bin/${provides[1]}"
	install -Dm755 "${provides[2]}" "${pkgdir}/usr/bin/${provides[2]}"

	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
