# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=moor
pkgname=${_pkgname}-bin
pkgver=2.9.4
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
sha256sums=('816fde7bdec651174d75623e1cfe29ecb91e28b23d99976a14fce40985e3ce11'
            'f5f073e5c2be82c3e2cb7e0b67a5a72c7f563f08bf7e45da3ed05b8c1358d45c'
            '413ed05afeae998deefc44972ede53c25f3d1b1fbd81667a716f7d307b3578ee'
            '663fec717c38f524c8e5c707ea17bd5d6ac92433f1487ade5f0e6fdebfee1358')
sha256sums_x86_64=('a7017adebd72fdd6dbbbd869e043d293727beec7e586bb37d0db654c7a0e9daa')
sha256sums_i686=('a7017adebd72fdd6dbbbd869e043d293727beec7e586bb37d0db654c7a0e9daa')
sha256sums_aarch64=('a7017adebd72fdd6dbbbd869e043d293727beec7e586bb37d0db654c7a0e9daa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "MOUSE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/MOUSE.md"
}
