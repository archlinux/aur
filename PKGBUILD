# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >


_pkgauthor=yamafaktory
_pkgname=jql
pkgname=${_pkgname}-bin
pkgver=8.0.9
_pkgvername=jql-v${pkgver}
pkgrel=1
pkgdesc='A JSON Query Language CLI tool'
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT' 'Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("PERFORMANCE-${pkgver}.md::${_urlraw}/PERFORMANCE.md"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE"
        "LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgvername}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgvername}-${_barch[1]}-unknown-linux-musl.tar.gz")

sha256sums=('667c6394ab64691f23424a24b0ac30a563d463cf6907d10cb5f51ddfbb0fec64'
            'b11bfca0e8536ccd29094bb5e7c932ac5744abaee6f314e49909aa2c3cca759e'
            'a2d0e76cc3e9053d72ab5372728ae01c3c323848db4d3c40d713f9de62be30cc'
            '2282729282450a05a4908270ed7685dfc6aa0c3e86f2352cf4daa252c4cf6bf8')
sha256sums_x86_64=('bd682a6eef48314204534ec59d45a53c7b8b9e8a5782ad4f6553cc45fa1a2ad5')
sha256sums_aarch64=('5027358299b6eb5c41941cc1c98ef79e3f44b02d39a56315aab39c1ad9585a38')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

    install -Dm644 "PERFORMANCE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PERFORMANCE.md"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
