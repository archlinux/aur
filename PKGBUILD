# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=super-trouper-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="MCP server for Frida"
arch=('x86_64' 'aarch64')
url="https://github.com/crissyfield/super-trouper"
license=('MIT')
provides=('super-trouper')
conflicts=('super-trouper')
depends=()
options=('!debug')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.xz::https://github.com/crissyfield/super-trouper/releases/download/v${pkgver}/super-trouper-${pkgver}-linux-amd64-musl.tar.xz")
sha256sums_x86_64=('2a1cb5a1d52efe69816179604b4e3b0c054b69d773829fa8efe3bc4dcba9f124')
sha256sums_aarch64=('1f3b1b106d82f1f65ffe50b5d9b61d4b10ed82574c3a73a1755abc1bc4f71ce2')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.xz::https://github.com/crissyfield/super-trouper/releases/download/v${pkgver}/super-trouper-${pkgver}-linux-arm64-musl.tar.xz")

latestver() {
    gh api repos/crissyfield/super-trouper/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 super-trouper "${pkgdir}/usr/bin/super-trouper"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
