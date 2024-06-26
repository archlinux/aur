# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagenormalizer-bin
_pkgname=ImageNormalizer
pkgver=1.2024.06.25
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
sha256sums_aarch64=('3997f96af2d2e7155377ff31dafb7377b7cf95cd604abce162f4063897ff4992')
sha256sums_x86_64=('130e722793e11f3c8e8c76f008136ee31efadc39d376a2b95a31cf27c6f888a9')
package() {
    install -Dm755 "${srcdir}/${_pkgname}_Linux_"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}