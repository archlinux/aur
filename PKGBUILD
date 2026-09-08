# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >

_pkgauthor=yamafaktory
_pkgname=jql
pkgname=${_pkgname}-bin
pkgver=9.0.3
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

sha256sums=('94d45d21bfed3816d472324d2059b6bb4b927c2f85c5bcff6301416640cae61d'
            '9c838d764df73a54555ceca5d5b4ee92be4e3ed846af876b0d992dd1f1694ada'
            'a2d0e76cc3e9053d72ab5372728ae01c3c323848db4d3c40d713f9de62be30cc'
            '2282729282450a05a4908270ed7685dfc6aa0c3e86f2352cf4daa252c4cf6bf8')
sha256sums_x86_64=('b1d5718b04c7cccd33735a25a85ade2f878b2bf402e1a037504f21f61f517099')
sha256sums_aarch64=('a26bcbb7a84f4125dcd2ece6e54b977a13b1ca6f994a4df7f27e00f0513153e3')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

    install -Dm644 "PERFORMANCE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PERFORMANCE.md"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
