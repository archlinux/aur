# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ruuda
_pkgname=rcl
pkgname=${_pkgname}-bin
pkgver=0.13.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A reasonable configuration language"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}-unknown-linux-gnu")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[1]}-unknown-linux-gnu")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '5c75808b98c2934070adf8c1522cf0951a5a78b6595d3b778402d513cf64ca32')
sha256sums_x86_64=('2611b34acc98c1131dbcbf263142dd46571b618e64452b08fbc3acf080864308')
sha256sums_aarch64=('b46c35e8cb850a5111e1fdd12e6c7274d8f2b50f3683f63a9ba3e698f9fdf103')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
