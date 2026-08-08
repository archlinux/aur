# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=ftop
pkgname=${_pkgname}-bin
pkgver=0.0.23
pkgrel=1
pkgdesc="Finformative top for finding fiery processes"

arch=('x86_64' 'i686' 'aarch64')
_barch=('386' '386' 'arm')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[2]}")
sha256sums=('ed6eec81442ed76d295d2aaadb26efad64c0132c9a793f16bbfa8952583b05c1'
            '3ad05fc69d54421bf089c0abd38fdd669fe362bdf6e3412f47641d63492c63c4')
sha256sums_x86_64=('5ddc9ab1dba64a1109afe310bbf6fe99a7008accfd7633cdcb4b0af27d66b342')
sha256sums_i686=('5ddc9ab1dba64a1109afe310bbf6fe99a7008accfd7633cdcb4b0af27d66b342')
sha256sums_aarch64=('327592e923ac51208d2f24f077a141c19bb3850d56fb183a381f9f656085335f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
