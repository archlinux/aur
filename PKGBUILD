# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fx-agent-bin
pkgver=0.0.14
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
sha256sums_aarch64=('9f5cfbac1728fffddc2d5d874d1f7fe8d34f179e1bc86fb2e67a6e75074e53f3')
sha256sums_x86_64=('731c1914fc2d497a10583f4416f8382c192e4897d6a0b4f713d6194455a8548b')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/vercel-labs/fx/releases/download/v${pkgver}/fx-linux-x86_64.tar.gz")

latestver() {
    gh api repos/vercel-labs/fx/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/fx" "${pkgdir}/usr/bin/fx"
}
