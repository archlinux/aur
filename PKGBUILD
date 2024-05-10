# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagenormalizer-bin
_pkgname=ImageNormalizer
pkgver=1.2024.05.04
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
sha256sums_aarch64=('0a9989e7c02fb5c3993db4bde6feffa1a082b8651056e9a05a3ce08e4a3ef795')
sha256sums_x86_64=('e1dbe768fe81feef8dafcf2bfda84e5ad7dea1ad3b1b7fea16352452b6948379')
package() {
    install -Dm755 "${srcdir}/${_pkgname}_Linux_"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}