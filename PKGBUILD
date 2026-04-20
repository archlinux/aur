# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagenormalizer-bin
_pkgname=ImageNormalizer
pkgver=1.2026.04.19
pkgrel=1
pkgdesc="A cross-platform command-line batch-processing tool that resizes and compresses images.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
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
    'dotnet-runtime>=10'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_x64.tar.gz")
sha256sums_aarch64=('4b5a72866b59e9a981facabe8e95f77ac35ca7ea0a9b62340ca9cd614959b445')
sha256sums_x86_64=('28857104baa86965cc29fc78ff9fa6044effad7331fae036547a03f14e330937')
package() {
    install -Dm755 "${srcdir}/${_pkgname}_Linux_"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
