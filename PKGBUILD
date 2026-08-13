# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sammcj
_pkgname=ingest
pkgname=${_pkgname}-bin
pkgver=0.15.6
pkgrel=1
pkgdesc="Parse files and websites to clipboard or a file for ingestions by AI / LLMs"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'ollama')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}")
sha256sums=('2624502660e8f7965bb276ea8c83586e6302b4e32f2b6d4d5249953e35caf610'
            '09506956bac009b12e3f74304fa86038533e8f57fc429203dadf9525425cb9ec')
sha256sums_x86_64=('6949e4d99e371e383810c4b978ca2f13d66699dec43a510de006682ae24e5bf5')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
