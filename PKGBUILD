# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unkn0wn-root
_pkgname=resterm
pkgname=${_pkgname}-bin
pkgver=0.13.0
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
            'f15ead990baf0c6360f2b9c5a1ff64f33aed859d50ee2ebce98ee84beaa4b914')
sha256sums_x86_64=('031d53ae7cc7a6e12436a993215f3635249afbcc3c8a59ef946fd5bc25be9b9c')
sha256sums_aarch64=('102d778d043dd512ae5e2cd1124b260c046b58c02e2fba08a87ae0600892bad9')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
