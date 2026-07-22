# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Microwave Tank <microwave@particlecannon.org>

_pkgauthor=pressly
_pkgname=goose
pkgname=${_pkgname}-bin
pkgdesc="A database migration tool. Supports SQL migrations and Go functions."

pkgver=3.27.3
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
sha256sums_x86_64=('ca18112e2438b3ad608af9a5938beafd01fa36a4a19a3edbe4f29226ca5c8533')
sha256sums_aarch64=('a774a3ed3381352a795b2a019b604792965546f6f47b34b59896288d97bf4809')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
