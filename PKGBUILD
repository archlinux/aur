# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >


_pkgauthor=yamafaktory
_pkgname=jql
pkgname=${_pkgname}-bin
pkgver=8.1.2
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

sha256sums=('b60a220657cb78fbfc6b64b0c38c156b7158e227b947147995fdc8a91f0fb167'
            'b11bfca0e8536ccd29094bb5e7c932ac5744abaee6f314e49909aa2c3cca759e'
            'a2d0e76cc3e9053d72ab5372728ae01c3c323848db4d3c40d713f9de62be30cc'
            '2282729282450a05a4908270ed7685dfc6aa0c3e86f2352cf4daa252c4cf6bf8')
sha256sums_x86_64=('57473f5b7c075fdcd315d2e576a17b47dcfd8b78ffa9094c3d072eea5d1e550c')
sha256sums_aarch64=('8db3486e12e5683f96cef5190c7522c018abfa8009d353252c060ebd97db52e8')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

    install -Dm644 "PERFORMANCE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PERFORMANCE.md"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
