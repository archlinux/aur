# Maintainer: jsimon0 <jonathansimon@protonmail.com>
_pkgname=immich-go
pkgname=immich-go-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="An alternative to the immich-CLI command that doesn't depend on a nodejs installation"
arch=('x86_64' 'aarch64')
url="https://github.com/simulot/immich-go"
license=('custom')
options+=('!strip')
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_x86_64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_aarch64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('7b1488dbe70ae605d1f524ffee61145990f1e46077f23438e0cb27c9cb1aabfc')
sha256sums_aarch64=('012cd26043dada11bae6c4f1eb1694793eaa4a3256baee4fd3d5b64fab08c0f0')

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
