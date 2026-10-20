# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-tui-bin
pkgver=2.46.0
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
sha256sums_x86_64=('8600f7ffc62bfcff31a02384adeef6f6ed75d3cc0a6a6400adbef3c1c8285a38')
sha256sums_aarch64=('443167b4580083af01a80b02d16bbe0ede8a42916eb009f46e61c0e39f4179f4')

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
