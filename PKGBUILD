# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagenormalizer-bin
_pkgname=ImageNormalizer
pkgver=1.2024.08.19
pkgrel=1
pkgdesc="A cross-platform command-line batch-processing tool that resizes and compresses images."
arch=(
    "aarch64"
    "x86_64"
)
url="https://github.com/mihnea-radulescu/imagenormalizer"
license=(
    "GPL-3.0-only"
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'dotnet-runtime>=8'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname}_Linux_x64.zip")
sha256sums_aarch64=('8fbe8bc1577090ef37f5c3ef8e31474a5a9f65438e7e5ac9c9ce9e7ad6b900bf')
sha256sums_x86_64=('329fab19ef3055159f1cd79586116910e1c76532758672f123217abc020ee984')
package() {
    install -Dm755 "${srcdir}/${_pkgname}_Linux_"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}