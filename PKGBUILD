# Maintainer: jinzhongjia <mail@nviemr.org>

pkgname=deepseek-tui-bin
_pkgname=deepseek-tui
pkgver=0.8.21
pkgrel=1
pkgdesc="Coding agent for DeepSeek models that runs in your terminal"
arch=('x86_64' 'aarch64')
url="https://deepseek-tui.com/"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
provides=('deepseek-tui' 'deepseek')
conflicts=('deepseek-tui' 'deepseek')
options=(!strip)

_relurl="https://github.com/Hmbown/DeepSeek-TUI/releases/download/v${pkgver}"

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/Hmbown/DeepSeek-TUI/v${pkgver}/LICENSE")
sha256sums=('91873e17f073f4dcddc63799a0a6fdeb44a281440b6c5e0b9d8ea2aa7f7ffd95')

source_x86_64=(
    "deepseek-${pkgver}-x86_64::${_relurl}/deepseek-linux-x64"
    "deepseek-tui-${pkgver}-x86_64::${_relurl}/deepseek-tui-linux-x64"
)
source_aarch64=(
    "deepseek-${pkgver}-aarch64::${_relurl}/deepseek-linux-arm64"
    "deepseek-tui-${pkgver}-aarch64::${_relurl}/deepseek-tui-linux-arm64"
)

sha256sums_x86_64=(
    '051bd194065570612efa1092e5b4c0d879f54af13328455bbf34d8b58d403e94'
    '4a9e2678343c062eed156a5fcfa6c29d65c3786730c11aff3a82204dddfc4209'
)
sha256sums_aarch64=(
    '9357bfdea9aff144cbb54db1645e70d865adaa51dc17ced117e156f7ae7c8b21'
    '44cf9b73cc93bb6d3f8aeca0c9bbc6d9f442890c392219ba73072e7e36296c34'
)

package() {
    install -Dm755 "${srcdir}/deepseek-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek"
    install -Dm755 "${srcdir}/deepseek-tui-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek-tui"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
