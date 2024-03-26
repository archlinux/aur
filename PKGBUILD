# Maintainer: jsimon0 <jonathansimon@protonmail.com>
_pkgname=immich-go
pkgname=immich-go-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="An alternative to the immich-CLI command that doesn't depend on a nodejs installation"
arch=('x86_64' 'aarch64')
url="https://github.com/simulot/immich-go"
license=('custom')
options+=('!strip')
source_x86_64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_x86_64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=(${_pkgname}-${pkgver}-${pkgrel}_Linux_aarch64.tar.gz::"${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('34b273b3eb263c3775d070eafc33efa0cc363048afd891659c983e6ee2003a71')
sha256sums_aarch64=('025066ffb1c29adba49534ba2d4a98e55ac79a71576d0640e842b36f5ae2324a')

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
