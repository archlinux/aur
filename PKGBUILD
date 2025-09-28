# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=moor
pkgname=${_pkgname}-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' 'i686' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('BSD-2-Clause-Views')

replaces=('moar' 'moar-bin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.1::${_urlraw}/${_pkgname}.1"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"MOUSE-${pkgver}.md::${_urlraw}/MOUSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[2]}")
sha256sums=('92520dd03635a719a3b72ca1f762521b09e3b12d9386ed0f0b56b0a92aa968fe'
            'f5f073e5c2be82c3e2cb7e0b67a5a72c7f563f08bf7e45da3ed05b8c1358d45c'
            '8309e899b3b6baad49d804a606e37cca4fc3ac130c984bb28a032e1b24c488fd'
            'c60a1740d54eb2ecff4120b8c5cce83861747eed2f67f349c768e68806f3a9fa')
sha256sums_x86_64=('00f0e31cf52deb06f3f083c9987ab99c00fa27843178abcd796da2ef107ff8b2')
sha256sums_i686=('00f0e31cf52deb06f3f083c9987ab99c00fa27843178abcd796da2ef107ff8b2')
sha256sums_aarch64=('00f0e31cf52deb06f3f083c9987ab99c00fa27843178abcd796da2ef107ff8b2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "MOUSE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/MOUSE.md"
}
