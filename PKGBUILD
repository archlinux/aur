# Maintainer: jsimon0 <jonathansimon@protonmail.com>
_pkgname=immich-go
pkgname=immich-go-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="An alternative to the immich-CLI command that doesn't depend on a nodejs installation"
arch=('x86_64' 'aarch64')
url="https://github.com/simulot/immich-go"
license=('custom')
options+=('!strip')
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_x86_64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_aarch64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('bc0da9d376127ca6c9996ff00d740212db77a3191000ace30f73b1c2921f9dca')
sha256sums_aarch64=('e8b52d419276d2b62262166dc799146469b901ee1c4065b5074bcfa91d730f5d')

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
