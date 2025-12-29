# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unkn0wn-root
_pkgname=resterm
pkgname=${_pkgname}-bin
pkgver=0.13.5
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
            '47920ba595c30f5ae6ce49d3b067c057dca0b2c79aaa4ec019ae8c76b710c756')
sha256sums_x86_64=('d62b88a9591df2fe7e72f559a138c0f1d8130be603ef3f62728a3903d6d618e2')
sha256sums_aarch64=('59acedbde0d1eadcd1b663080c4a17a682390882c762f8bf4839255f93fce484')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
