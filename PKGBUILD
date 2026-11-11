# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Microwave Tank <microwave@particlecannon.org>

_pkgauthor=pressly
_pkgname=goose
pkgname=${_pkgname}-bin
pkgdesc="A database migration tool. Supports SQL migrations and Go functions."

pkgver=3.30.0
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
sha256sums=('cfd5c31d746f8a2f9131d959236c6a96554e8adbd312a9177de701f6c4cf6bea'
            'f23985556a879c0e68bb4e136ee4b88a550d26fa33db77a65d76b721c93093ef')
sha256sums_x86_64=('cce6e6371670f0654adc0ece407b81a22e53ba51e24e17a80ff7a0e25cda8548')
sha256sums_aarch64=('624ae3159e221494c5e780c772cc000d788a4afe34a791553e43b2419174a715')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
