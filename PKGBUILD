# Maintainer: jinzhongjia <mail@nviemr.org>

pkgname=deepseek-tui-bin
_pkgname=deepseek-tui
pkgver=0.8.38
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
    'a1d9b03b3906f607bd835b70947270e856d44866e0d6f37d71e821354ab5ab57'
    '0f626ade7ece88e2b337ffb9a571c4aee932656f4156ed3843fe5d1153a1e92e'
)
sha256sums_aarch64=(
    '9a6786b7c8cad153c692814d8375a37ef4ce93a4ac3ea50cca9c71e25d363a97'
    'f622474cede9d842aa3eedbbdc55a6e68723d65ebf3f641e9559c4f7434bea2a'
)

package() {
    install -Dm755 "${srcdir}/deepseek-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek"
    install -Dm755 "${srcdir}/deepseek-tui-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek-tui"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
