# Maintainer: jsimon0 <jonathansimon@protonmail.com>
_pkgname=immich-go
pkgname=immich-go-bin
pkgver=0.9.12
pkgrel=1
pkgdesc="An alternative to the immich-CLI command that doesn't depend on a nodejs installation"
arch=('x86_64' 'aarch64')
url="https://github.com/simulot/immich-go"
license=('custom')
options+=('!strip')
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_x86_64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_aarch64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('8fd856dae257dc70425e188ed905ffb0922b3c601c76a6b4da3c0bbd989ec8a7')
sha256sums_aarch64=('a82a8447f62f86a5e074747c997c3c5c2d0bc0393363a072dd246c4bed576c54')

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
