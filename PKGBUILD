# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bjarneo
_pkgname=peachy
pkgname=${_pkgname}-bin
pkgdesc="A delightful TUI for creating terminal color themes from images"

pkgver=1.0.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=('glibc' 'libgcc' 'imagemagick')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('84ea14e1b2f0a3907087ee66dafec1d144aeabd3e9806f40108c7db437ddc933'
            '57764ebae827c1c96dc5c1b74e2579ff34d3abcaabb54f5e5498fb2f612330cc')
sha256sums_x86_64=('46e8adb9b682eae398b1b1e3321b2422475544b80b4068586e3fe59f340f7410')
sha256sums_aarch64=('4189c0cb1f6eb6ce910037f7cc8aad6c78c6628f1b908ce0d9bf2751c566cc18')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

