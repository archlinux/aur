# Maintainer: jinzhongjia <mail@nviemr.org>

pkgname=deepseek-tui-bin
_pkgname=deepseek-tui
pkgver=0.8.39
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
    '2c8eb84034fb5d99077a460dd6137f2c919c6d8a2584ce2647540d90d3de1a8e'
    'e4f7601c7c54e5f26b8b207cb8f3da038f86b868b9afc1d45d9e47606d6a5802'
)
sha256sums_aarch64=(
    '41eae3b3cc43c0ca2fdbe2eedf2054ce46e31602be48cc11ad252d889c043866'
    '08b379583cee5be5e071e028ea7a7682252741931265a3b8eae054a69824cbe5'
)

package() {
    install -Dm755 "${srcdir}/deepseek-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek"
    install -Dm755 "${srcdir}/deepseek-tui-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek-tui"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
