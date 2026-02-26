# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paulrobello
_pkgname=par-fractal
pkgname=${_pkgname}-bin
pkgdesc="Cross-platform GPU-accelerated fractal renderer built with Rust and WebGPU"

pkgver=0.8.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("${_pkgname}.desktop"
		"ICON-${pkgver}.png::${_urlraw}/icons/mstile-150x150.png"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('11060d5e8b9089335d33cb0a7fadcddf61770efa03413ce6e7c0689a1f3f274d'
            '7f951272ea9e210bff0ad22095ef3761f5973a98a0e08a54744100da427df891'
            'e0ffb3015e7d65f44d53d4900da4e5347b58bf103250c202c45938e48a3d5a40'
            '7517f84253241eb992f31ea2fb3cfe12a1dad6acfd5a0884f98506f5dfc9f75b')
sha256sums_x86_64=('e5d4679e17dd26d64a36a83dddfa003a969dcf1b0fcd2b07332d00ec24c64391')
sha256sums_aarch64=('45dd564f76750a3d426d8aaae34a8ea16c05f2ef93018e78bc2ce23e075fc1c4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
