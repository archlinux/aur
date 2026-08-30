# Maintainer: FTS427 <FTS427@outlook.com>
# Contributor: futrime <https://github.com/futrime>
pkgname=lip-bin
_pkgname=lip
pkgver=0.34.8
pkgrel=1
pkgdesc="A general package installer"
arch=('x86_64' 'aarch64')
url="https://github.com/futrime/lip"
license=('GPL3')
conflicts=('lip-git')
options=(!strip)
source_x86_64=(
    "${pkgname}-${arch}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.xz"
    "LICENSE::${url}/blob/main/COPYING"
    "lip.1")
source_aarch64=(
    "${pkgname}-${arch}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.xz"
    "LICENSE::${url}/blob/main/COPYING"
    "lip.1")
sha256sums_x86_64=('00ad345474eb7263cde80bdf3d4a85e5c14dffcb73682293334165391ec5b343'
                   'SKIP'
                   '341f8366713c3463d309d7db58b4b4f1ac270a03afe5714ddd3bc2195d293cfd')
sha256sums_aarch64=('f9cbc4e10976b8acdaed8718189098ad2a5a43f7962de479b9634cc9e0b449ea'
                    'SKIP'
                    '341f8366713c3463d309d7db58b4b4f1ac270a03afe5714ddd3bc2195d293cfd')
prepare() {
    tar -Jxf "${pkgname}-${arch}-${pkgver}.tar.xz"
}
package() {
    install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 755 "${_pkgname}d" "${pkgdir}/usr/bin/${_pkgname}d"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm 644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
