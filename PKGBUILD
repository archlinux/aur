# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >


_pkgauthor=yamafaktory
_pkgname=jql
pkgname=${_pkgname}-bin
pkgver=8.0.10
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

sha256sums=('5c969ca76513dc01b2a70dc057920675551a91102c62b9e16f5cde6b6118e1f0'
            'b11bfca0e8536ccd29094bb5e7c932ac5744abaee6f314e49909aa2c3cca759e'
            'a2d0e76cc3e9053d72ab5372728ae01c3c323848db4d3c40d713f9de62be30cc'
            '2282729282450a05a4908270ed7685dfc6aa0c3e86f2352cf4daa252c4cf6bf8')
sha256sums_x86_64=('b3849f47c49eb4d37260f3d575b2dec3428779c56423c3ea5c393c626779354b')
sha256sums_aarch64=('8c1e764bdcc561f67c8be536af53d04cbb4f3cdda735e5957e966866ed7408d7')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

    install -Dm644 "PERFORMANCE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PERFORMANCE.md"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
