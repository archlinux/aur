# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=walles
_pkgname=ftop
pkgname=${_pkgname}-bin
pkgver=0.0.24
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
sha256sums_x86_64=('af3b18315accbeb93c5df51af61bb2b045d574c19325ed73f782d50e1a2320e5')
sha256sums_i686=('af3b18315accbeb93c5df51af61bb2b045d574c19325ed73f782d50e1a2320e5')
sha256sums_aarch64=('7ef2bd82d86c317aea08811ec386614866788ac08adc6d810326e431905fce72')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
