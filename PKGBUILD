# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Zachary Siedlecki <zacharysiedlecki01@gmail.com>
pkgname=superfile-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="Pretty fancy and modern file manager in terminal file manager"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/MHNightCat/superfile"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'perl-image-exiftool'
)
optdepends=(
    'perl-archive-zip: Support for zip files, including epub'
    'perl-io-compress-brotli: Support for brotli-compressed metadata' 
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/MHNightCat/superfile/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}-arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}-arm.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86-64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}-amd64.tar.gz")
sha256sums=('cd6016ddc3148470a63564380bca1d4499ecc5fa3a89574c6a4cf4053dfcc1e4')
sha256sums_aarch64=('29fe18f4acbbad377179b0937576ac9ae58139e46fdc0201046d542a3d9a757a')
sha256sums_armv7h=('994b7a9f63ed775b62602a6e5b4d102302e263c489e6c3799a2753d09c1ac5ed')
sha256sums_x86_64=('5fd951050efb8815b8d419fe815e5945337b03f2558f32ac286a11f104f1f2a3')
package() {
    install -Dm755 "${srcdir}/dist/${pkgname%-bin}-linux-v${pkgver}-"*/spf "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}