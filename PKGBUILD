# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=fluxdown-cli-bin
pkgver=0.6.7
pkgrel=1
pkgdesc="FluxDown CLI - 命令行客户端，管理 FluxDown App / Server 的下载任务（musl 静态链接）"
arch=('x86_64' 'aarch64')
url="https://fluxdown.com"
license=('AGPL-3.0-only')
provides=('fluxdown-cli')
conflicts=('fluxdown-cli')
options=('!strip')

source_x86_64=("FluxDown-CLI-${pkgver}-linux-x64.tar.gz::https://github.com/zerx-lab/FluxDown/releases/download/v${pkgver}/FluxDown-CLI-${pkgver}-linux-x64.tar.gz")
source_aarch64=("FluxDown-CLI-${pkgver}-linux-arm64.tar.gz::https://github.com/zerx-lab/FluxDown/releases/download/v${pkgver}/FluxDown-CLI-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('7b101f44e86888e6974676050c2d0b7c5b6f12b917dbaf57b7497db7dc88df00')
sha256sums_aarch64=('3a44fcb2eb2d93f7213a3a22c824d42367b0d5e806d7b5640608fb848a6edf2e')

package() {
    local _platform
    case "$CARCH" in
        x86_64)  _platform="linux-x64" ;;
        aarch64) _platform="linux-arm64" ;;
    esac
    install -Dm755 "$srcdir/fluxdown-cli-${pkgver}-${_platform}/fluxdown" \
        "$pkgdir/usr/bin/fluxdown"
}
