# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sammcj
_pkgname=gollama
pkgname=${_pkgname}-bin
pkgver=2.0.7
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
            'c78a590f3a1c5033429259342d3a863eeea1e754c99e5997381304b117bc39ed')
sha256sums_x86_64=('b6c77db09e14d2581ebd3d590df29da7d38170e8c37f5ed67e1a995d54adbe7d')
sha256sums_aarch64=('57708f266e5b94b7cf2cb1836cfb0e551c7581057a9e3abb76d8609fff656437')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
