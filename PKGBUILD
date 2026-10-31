# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=fluxdown-cli-bin
pkgver=0.6.4
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
sha256sums_x86_64=('d512758a4534a94bef9e4267c9eac01e09249a15d65c80b9783b05f8472fb6ca')
sha256sums_aarch64=('022c916236ae280718eb6e36030fd7fb61177f07b48f3ff8e4fdae896b9f74af')

package() {
    local _platform
    case "$CARCH" in
        x86_64)  _platform="linux-x64" ;;
        aarch64) _platform="linux-arm64" ;;
    esac
    install -Dm755 "$srcdir/fluxdown-cli-${pkgver}-${_platform}/fluxdown" \
        "$pkgdir/usr/bin/fluxdown"
}
