# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=moor
pkgname=${_pkgname}-bin
pkgver=2.13.1
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration"

arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('BSD-2-Clause-Views')

replaces=('moar' 'moar-bin')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.1::${_urlraw}/${_pkgname}.1"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"MOUSE-${pkgver}.md::${_urlraw}/MOUSE.md"
		"README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[2]}")
sha256sums=('44cf1243696fbbeb63c8144899243dabe5bf47c082609da8ab6d60af0971a900'
            'f5f073e5c2be82c3e2cb7e0b67a5a72c7f563f08bf7e45da3ed05b8c1358d45c'
            '663fec717c38f524c8e5c707ea17bd5d6ac92433f1487ade5f0e6fdebfee1358'
            '6d8f44326a0d5a67b87f2fc2ac86df1782ae6f0c06192512cdf052fcc49beea9')
sha256sums_x86_64=('2c1d587a1f4a91ba6bde933654e0ed78d7fd060dc3e257c782c35dd059be3860')
sha256sums_i686=('a83f81a2f9915a50120679853ca6d12c00bad78d15fa0f1d10ed2d3bdc29fbd6')
sha256sums_aarch64=('76d395902885075453bb42e8628de88bf69a989becc7e19c25a17a2906aa688f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "MOUSE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/MOUSE.md"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
