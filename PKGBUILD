# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fx-agent-bin
pkgver=0.0.18
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
sha256sums_aarch64=('432a343b7d0fb15dce454ab1e100401df1ee4f01fb1e689a64557e6b9a57ece5')
sha256sums_x86_64=('e4912040c1fb2a1cda4162fd8f40fc66aa80a1a0a306af6332b5426bdcac99b6')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/vercel-labs/fx/releases/download/v${pkgver}/fx-linux-x86_64.tar.gz")

latestver() {
    gh api repos/vercel-labs/fx/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/fx" "${pkgdir}/usr/bin/fx"
}
