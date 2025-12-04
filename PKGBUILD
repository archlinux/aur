# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unkn0wn-root
_pkgname=resterm
pkgname=${_pkgname}-bin
pkgver=0.9.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc='Terminal REST client for .http/.rest files with HTTP, GraphQL and gRPC support'
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}")

sha256sums=('69bc8d0e826b5bb133e6ff78837f6aa210020479c0202068eaca6ae8ee988418'
            'c9eba087c97e8c336c3f514b38d2ecfe66d3535b80b0a269a5314f2310c36cba')
sha256sums_x86_64=('f78cb103069619f3de27b9d773da3692662cdba8e8207b7b6769cd8b5315207a')
sha256sums_aarch64=('fda9befada74e51c7f4380d02aa5064e1513501f9006367fe56a3bd2d6195c7b')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
