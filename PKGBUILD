# Maintainer: jinzhongjia <mail@nviemr.org>

pkgname=deepseek-tui-bin
_pkgname=deepseek-tui
pkgver=0.8.26
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
    '130fb99aacb396b8bb7937e043eaaba405085c89dc3aef63cac7cdb2ed3bc92f'
    '74b1c2201b3ad29b05468278d73deee700b382c0df2acce8c67a9930d2ca1ebf'
)
sha256sums_aarch64=(
    'bce012e61ac77f73220b7ea838bb9fec32e7cf92f59b9c9a12354c64a2bef495'
    '48e43d1fa527fc47ff798b8b6103199f137e5021ccf5b821cda3ecb1961c9b87'
)

package() {
    install -Dm755 "${srcdir}/deepseek-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek"
    install -Dm755 "${srcdir}/deepseek-tui-${pkgver}-${CARCH}" \
        "${pkgdir}/usr/bin/deepseek-tui"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
