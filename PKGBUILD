# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Zachary Siedlecki <zacharysiedlecki01@gmail.com>
pkgname=superfile-bin
_pkgname=spf
pkgver=1.1.3
pkgrel=1
pkgdesc="Pretty fancy and modern file manager in terminal file manager"
arch=(
    'aarch64'
#    'armv7h'
    'x86_64'
)
url="https://github.com/MHNightCat/superfile"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    #'perl-image-exiftool'
)
optdepends=(
    'perl-archive-zip: Support for zip files, including epub'
    'perl-io-compress-brotli: Support for brotli-compressed metadata' 
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/MHNightCat/superfile/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}-arm64.tar.gz")
#source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}-arm.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86-64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}-amd64.tar.gz")
sha256sums=('cd6016ddc3148470a63564380bca1d4499ecc5fa3a89574c6a4cf4053dfcc1e4')
sha256sums_aarch64=('ee2e88b57a213088da0af41d6d3d748ba62e1c65082ee249fc7c96bc69c0b51f')
sha256sums_x86_64=('5ec0e3fd1413fa657dddab0fbdecd09cdedee70db33acf3467c4540da4600c8f')
package() {
    install -Dm755 "${srcdir}/dist/${pkgname%-bin}-linux-v${pkgver}-"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}