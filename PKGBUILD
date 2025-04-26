# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dalance
_pkgname=ptags
pkgname=${_pkgname}-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="A parallel universal-ctags wrapper for git repository."
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-lnx.zip")
sha256sums=('ee1385b842d5354a2403ddc622e9f29671a5283b5e7af914a1b082f9f0bfbc56'
            '972de376d8063bc561e51f899386ee6b3574689693c6307e826f579a569663b3')
sha256sums_x86_64=('49ef2941734e9cb78d3ee5e90d204f56fb93b990591b71231d7e4e49e4d668e6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
