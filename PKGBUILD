# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sammcj
_pkgname=gollama
pkgname=${_pkgname}-bin
pkgver=1.36.1
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
            '80da23a8c427378e85cf46942e58d1951979a17d0f8b0aee428716a09c411f12')
sha256sums_x86_64=('4a80520812f829a742aa644ee624184bc5b7baad1619dde011909dc8fa88ab82')
sha256sums_aarch64=('b58c4be92d75b29972f1e27b9c7bfaf3fda8499d2c09c4b5bbc10e2b129a9091')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
