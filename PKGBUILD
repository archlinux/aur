# Maintainer: jinzhongjia <mail@nviemr.org>

pkgname=deepseek-tui-bin
_pkgname=deepseek-tui
pkgver=0.8.37
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
    'afa249cd9ca5f50ac73f529679d303b16a888a97102f72bde6f81cad0466b9e7'
    'd1a1697c061b40bb9943bd9b66750990533029d1c4cfcf297e574632c1f08f67'
)
sha256sums_aarch64=(
    '207e89494af555d2cb50560dfc79877cddc78810d803c3830b304ebfd31ace51'
    '8c0773a4e2787ab2bc3c048163ad31d3243227741721d8ecdca37f1b40139235'
)

package() {
    install -Dm755 "${srcdir}/deepseek-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek"
    install -Dm755 "${srcdir}/deepseek-tui-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek-tui"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
