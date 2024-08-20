# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>
_pkgname=jd
pkgname="${_pkgname}-tool-bin"
pkgver=1.9.1
pkgrel=1
pkgdesc="JSON diff and patch"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/josephburnett/jd"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/josephburnett/jd/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-arm64-linux")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-amd64-linux")
sha256sums=('7db445fe94ae6fb0c5ab69a6b47ec38a0e4b6d5a38f9d1493c0d8cb7c8ad2516')
sha256sums_aarch64=('29f0df95c3bbc064bffab1b31a1c156aafbd92cd5fa0fe0dc31b616604db80f7')
sha256sums_x86_64=('382a69c0720a94515cb07bf8e0b89fbfa577140fc92e23b128455b5ae682e523')
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}