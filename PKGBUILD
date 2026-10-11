# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Microwave Tank <microwave@particlecannon.org>

_pkgauthor=pressly
_pkgname=goose
pkgname=${_pkgname}-bin
pkgdesc="A database migration tool. Supports SQL migrations and Go functions."

pkgver=3.29.0
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
sha256sums=('39417aee628a52856e73ee311435469783240f8459d9acf95509733cd10531c6'
            'f23985556a879c0e68bb4e136ee4b88a550d26fa33db77a65d76b721c93093ef')
sha256sums_x86_64=('cc56e2f75532a4dd52f5ef2d31db0121e91079a9c2617bc0ad4e04e2d41c228b')
sha256sums_aarch64=('efdb8f97176df746cf3970ed40810816a51927da0600b152ac4359ae2b7c0e12')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
