# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

_pkgauthor=yamafaktory
_pkgname=jql
pkgname=${_pkgname}-bin
pkgver=8.3.0
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

sha256sums=('4888fd280a985edf367e4464abf9f55ecd4d0d8c7aeb5bee42da2abba19deb76'
            'eb476c2c44de5a27422a6b97c949f40ad5b058ce553276256801af0b7e9845ec'
            'a2d0e76cc3e9053d72ab5372728ae01c3c323848db4d3c40d713f9de62be30cc'
            '2282729282450a05a4908270ed7685dfc6aa0c3e86f2352cf4daa252c4cf6bf8')
sha256sums_x86_64=('ccc64d3f7924fee6e998ef8b80db12f2d4cf6a19a65540368b8161fd14889fe2')
sha256sums_aarch64=('d4877cf023a6c46f01c60934567a25a2416de739efd194f74169b546ecb329ff')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

    install -Dm644 "PERFORMANCE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PERFORMANCE.md"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
