# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagenormalizer-bin
_pkgname=ImageNormalizer
pkgver=1.2025.06.25
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
    'dotnet-runtime>=8'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_x64.tar.gz")
sha256sums_aarch64=('dddf600a87d36f9937a75547d052420ee96c67f00009ac7bfc95c2a80cc24d8d')
sha256sums_x86_64=('a4caaa88b0269928241a72a2cc1a851d9308fae9433b58ad6d65b3c7ead488d4')
package() {
    install -Dm755 "${srcdir}/${_pkgname}_Linux_"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
