# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Dark-Alex-17
_pkgname=managarr
pkgname=${_pkgname}-bin
pkgver=0.8.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A TUI and CLI for managing *arr servers"
arch=('x86_64' 'aarch64')
_barch=('linux-musl' 'aarch64-gnu')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('LicenseRef-Managarr')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md"
        "CODE_OF_CONDUCT-${pkgver}.md::${_urlraw}/CODE_OF_CONDUCT.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('fe07b0be3b1da93a987db6ac910f0f01b2c64c46e74e13307737f7741ec26e5c'
            'c4493cb17df836cdf14570a589fc0317db18e46908fa3ed0721baf503ccbc390'
            '7973aeb5cebdced1d53bdbf30f147257278b6ac5105b51c392332d2cf44f3f7b'
            '1567b9c69adab84f053e70eb684b55fa0bc2ad0e1fdd55ab49a71928961ecfe8'
            '8f65d095106dff69c3a5f2675fe8de3fe96c71cf1dc6063b9545b90194d1a00b'
            '0a587d5756acbc0e9e3377492cae59f21208107470e9dd55baa11db267e6f83f')
sha256sums_x86_64=('c07c5d7e2fa8bbd810a8816c1d5020a5a2ee0b75a54ec9f83e9f29f8baa1b72e')
sha256sums_aarch64=('d4f722d61d9ab99b8d2beb18d0bc1cae7301bb620bdf598b0e491c3a1a86ccdf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "CODE_OF_CONDUCT-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
