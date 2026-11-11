# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unkn0wn-root
_pkgname=resterm
pkgname=${_pkgname}-bin
pkgver=1.18.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc='Terminal REST client for .http/.rest files with HTTP, GraphQL and gRPC support'
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
optdepends=("${_pkgname}-runner")

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}")

sha256sums=('69bc8d0e826b5bb133e6ff78837f6aa210020479c0202068eaca6ae8ee988418'
            '1e819c4791ed3be86daf634d4d8866584469de87077bee90fef1557d27f499fc')
sha256sums_x86_64=('61d2e155f4cffd0cb7522a62de47a028c29737a8b607b553ea07f7a21e4be4d2')
sha256sums_aarch64=('986467fbb3c6108ef34ee58eb01a5446ee1e1e863c432c022ebf54a244bd2d84')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
