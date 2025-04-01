# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Zachary Siedlecki <zacharysiedlecki01@gmail.com>
pkgname=superfile-bin
_pkgname=spf
pkgver=1.2.1
pkgrel=1
pkgdesc="Pretty fancy and modern file manager in terminal file manager.Written in Go.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://superfile.netlify.app/"
_ghurl="https://github.com/MHNightCat/superfile"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86-64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}-amd64.tar.gz")
sha256sums=('8c20ae0ba48051c642aea028cf0ea6331e49e99a10e57b98bd3e4d8ec0795f1b')
sha256sums_aarch64=('36326016e5d15f9ff4293a85353ea5b7ac645b465d723c75592503f2c06007d2')
sha256sums_x86_64=('8f6183530ddb27b949d753d7ab87fe437ff28a1fcc3e96788833589c76e95eb3')
package() {
    install -Dm755 "${srcdir}/dist/${pkgname%-bin}-linux-v${pkgver}-"*/"${_pkgname}" -t "${pkgdir}/usr/bin"
    ln -sf "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}