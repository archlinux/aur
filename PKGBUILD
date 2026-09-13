# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fx-agent-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="Unix like coding agent"
arch=('aarch64' 'x86_64')
url="https://github.com/vercel-labs/fx"
license=('Apache-2.0')
provides=('fx-agent')
conflicts=('fx-agent' 'fx')
depends=()
options=('!debug')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::https://github.com/vercel-labs/fx/releases/download/v${pkgver}/fx-linux-aarch64.tar.gz")
sha256sums_aarch64=('741eb64e832d168309025fb9e84a0ccb1b842043d796f18898ed06c65d83a498')
sha256sums_x86_64=('710069648015f37f68123adc6f9f6137d7075681fb7a0881e251c1b9fe860a85')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/vercel-labs/fx/releases/download/v${pkgver}/fx-linux-x86_64.tar.gz")

latestver() {
    gh api repos/vercel-labs/fx/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/fx" "${pkgdir}/usr/bin/fx"
}
