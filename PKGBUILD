# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=azolfagharj
_pkgname=tmq
pkgname=${_pkgname}-bin
pkgdesc="A lightweight, portable, cross-platform, and fully featured command-line TOML processor"

pkgver=1.0.3
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('293e98e652c95260c1856cef0b21ae00f5f3190c574ddaa6928a5cb5e8d295d4'
            'd0306106bb50851eac276094fc4982f923a30eef68aa191666281f51e30992f3')
sha256sums_x86_64=('0e1c7ea808b491bd2f92091320e2f472cb33b003fdc7fbdfec8e21cdaa5a323f')
sha256sums_aarch64=('48da2e4eae0fdd56c5b502c7228c0ea1fc6fb1510f931343d1dd8a203f05c9b4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
