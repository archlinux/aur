# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=fluxdown-cli-bin
pkgver=0.4.6
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
sha256sums_x86_64=('8a523307006b868fe449456e52552b776e7e077f0609b2f637a65babfaca7831')
sha256sums_aarch64=('feb3581987c6fb1d2850cef430e9cb413ff978509e19d9267ddb765a67745ef3')

package() {
    local _platform
    case "$CARCH" in
        x86_64)  _platform="linux-x64" ;;
        aarch64) _platform="linux-arm64" ;;
    esac
    install -Dm755 "$srcdir/fluxdown-cli-${pkgver}-${_platform}/fluxdown" \
        "$pkgdir/usr/bin/fluxdown"
}
