# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=fluxdown-cli-bin
pkgver=0.4.8
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
sha256sums_x86_64=('b3de0a5eb6572ec44c2f4d7a1f18a641747b40e8089d7e5181ef121b50fa7ecc')
sha256sums_aarch64=('bec95c932bc383b9d2b6ad06b4f3e160c7d5a864686ec4c751ec7dbd77e3ee95')

package() {
    local _platform
    case "$CARCH" in
        x86_64)  _platform="linux-x64" ;;
        aarch64) _platform="linux-arm64" ;;
    esac
    install -Dm755 "$srcdir/fluxdown-cli-${pkgver}-${_platform}/fluxdown" \
        "$pkgdir/usr/bin/fluxdown"
}
