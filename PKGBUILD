# Maintainer: jsimon0 <jonathansimon@protonmail.com>
_pkgname=immich-go
pkgname=immich-go-bin
pkgver=0.9.6
pkgrel=1
pkgdesc="An alternative to the immich-CLI command that doesn't depend on nodejs installation."
arch=('x86_64' 'aarch64')
url="https://github.com/simulot/immich-go"
license=('custom')
options+=('!strip')
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_x86_64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_aarch64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('c2553b147832f8551d465f156323ab572dabb3cd86239ba0813f0c6437557906')
sha256sums_aarch64=('e8c7f57dff66e48ecf88c96f250bcb8ffb3b4d12d4d33831d142009c911c49bf')

prepare() {
    _tarball="${_pkgname}-${pkgver}-${pkgrel}_Linux_${CARCH}.tar.gz"
    mkdir -p src
    tar zxvf "${_tarball}" -C src
}

package() {
    _binary="src/immich-go"

    install -dm0755 "${pkgdir}/usr/bin"
    install -Dm0755 "${_binary}" "${pkgdir}/usr/bin/"
}
