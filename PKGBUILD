# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sammcj
_pkgname=gollama
pkgname=${_pkgname}-bin
pkgver=2.0.5
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
            '886b8eaef7b8458c511c641d88cfda142c875b994c5a2befff07fc45fdafdc1d')
sha256sums_x86_64=('7bf6abb96bf7b36e5080fabb6cfd2f09119eb22cf1ca1fe4b835429bba68468b')
sha256sums_aarch64=('6676d70d77f169c0fa18c329f3ac52956b9d5eea880704e0171cc289d9870027')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
