# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sammcj
_pkgname=gollama
pkgname=${_pkgname}-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Go manage your Ollama models"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'ollama')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[0]}.zip")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${_barch[1]}.zip")
sha256sums=('2624502660e8f7965bb276ea8c83586e6302b4e32f2b6d4d5249953e35caf610'
            '328f19c0e51ba23ea23cfbeeb52af0e979ccf48dc629b5fe5be36b2a560185db')
sha256sums_x86_64=('c8addede491b7968fbc3caaa8501f4e4e555ee06baabf864cb7934e15eab79e8')
sha256sums_aarch64=('ff324fbcd33ac29552940a8abae36a610367c48ea61f7250dd1ab4461ba79be5')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
