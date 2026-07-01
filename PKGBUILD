# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Microwave Tank <microwave@particlecannon.org>

_pkgauthor=pressly
_pkgname=goose
pkgname=${_pkgname}-bin
pkgdesc="A database migration tool. Supports SQL migrations and Go functions."

pkgver=3.27.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('11a3ebc0f59a28dde7994eab1f063e2952e7af26a040136f8b700038f8a5ce98'
            'f23985556a879c0e68bb4e136ee4b88a550d26fa33db77a65d76b721c93093ef')
sha256sums_x86_64=('29abceca027ee0da2cf28ca6c64c76d08e52a28acd4cf1919b832c77dd4bec4b')
sha256sums_aarch64=('baf96c5ddeadc2bfe4a8d640a717dba017aa0eb7fea379d52b5e6437e75ce96e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
