# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=unkn0wn-root
_pkgname=resterm
pkgname=${_pkgname}-bin
pkgver=0.11.6
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
            'b7a3b82445df1d84cca1e7cc344b0667234e607452bd5e674f10d429fcd01db2')
sha256sums_x86_64=('ddaf75e1374c628649aa9ee76fb574023cfd0771ee18e4e32b52529df9fed7fd')
sha256sums_aarch64=('4b3506c4d466ef082da6eddfc15a4918d7db19e9ae9e321e48d41654ddb62cbd')

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
