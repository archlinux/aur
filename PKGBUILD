# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=fluxdown-cli-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="FluxDown CLI - 命令行客户端，管理 FluxDown App / Server 的下载任务（musl 静态链接）"
arch=('x86_64' 'aarch64')
url="https://fluxdown.zerx.dev"
license=('AGPL-3.0-only')
provides=('fluxdown-cli')
conflicts=('fluxdown-cli')
options=('!strip')

source_x86_64=("FluxDown-CLI-${pkgver}-linux-x64.tar.gz::https://github.com/zerx-lab/FluxDown/releases/download/cli-v${pkgver}/FluxDown-CLI-${pkgver}-linux-x64.tar.gz")
source_aarch64=("FluxDown-CLI-${pkgver}-linux-arm64.tar.gz::https://github.com/zerx-lab/FluxDown/releases/download/cli-v${pkgver}/FluxDown-CLI-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('5a5c2030a143332664992844ed392953f62f77203f58254dfb3c40826b5072e4')
sha256sums_aarch64=('9794b6cf7839a28a3d0446c5360d5174518430ee4d70e0d4e6a73d1d6a26e642')

package() {
    local _platform
    case "$CARCH" in
        x86_64)  _platform="linux-x64" ;;
        aarch64) _platform="linux-arm64" ;;
    esac
    install -Dm755 "$srcdir/fluxdown-cli-${pkgver}-${_platform}/fluxdown" \
        "$pkgdir/usr/bin/fluxdown"
}
