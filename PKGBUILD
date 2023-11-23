# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tailspin-bin
_pkgname=tspin
pkgver=2.2.0
pkgrel=1
pkgdesc="A log file highlighter"
arch=(
    "aarch64"
    "x86_64"
)
url="https://github.com/bensadeh/tailspin"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/bensadeh/tailspin/${pkgver}/LICENCE")
source_aarch64=("${pkgname%-bin}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-aarch64-unknown-linux-musl.tar.gz")
source_x86_64=("${pkgname%-bin}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('11195f352a29af27ce53f2885d831a1bc6dfa9648bec9341921d186bbf6742e9')
sha256sums_aarch64=('e6d8c2fed38a7e78c26463ddb6491c4df7f5c2f3d1d9f1a0cffb424df3e3afa5')
sha256sums_x86_64=('3cd73cace911b8a7027d5efc05d33be5074ceffc85a08cf50ae6609cb6b12f2b')
package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}