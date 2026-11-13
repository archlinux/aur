# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-tui-bin
pkgver=2.61.0
pkgrel=1
pkgdesc="DeepSeek-Reasonix CLI - Reasonix TUI client for DeepSeek models (terminal UI)"
arch=('x86_64' 'aarch64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('deepseek-reasonix-tui' 'reasonix-tui' 'reasonix')
conflicts=('deepseek-reasonix-tui' 'reasonix-tui' 'reasonix')
options=('!strip')

_relurl="https://github.com/esengine/DeepSeek-Reasonix/releases/download/v${pkgver}"

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/v${pkgver}/LICENSE")
sha256sums=('dc024237821ac82056c37f8d82e3be919bd51e39a4529ec12a8ab3e2a346dc4c')
sha256sums_x86_64=('ceb15ec2f5509325a9f2f314b28758286a88492064a40f12d1ced1440f45fa0b')
sha256sums_aarch64=('08ce828507427f3f0e475e2b0bf5e71944e30e49b197fc8bd2ab8dc25983f174')

source_x86_64=(
    "reasonix-${pkgver}-linux-amd64.tar.gz::${_relurl}/reasonix-linux-amd64.tar.gz"
)
source_aarch64=(
    "reasonix-${pkgver}-linux-arm64.tar.gz::${_relurl}/reasonix-linux-arm64.tar.gz"
)

package() {
    install -Dm755 "${srcdir}/reasonix" "${pkgdir}/usr/bin/reasonix"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
