# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fx-agent-bin
pkgver=0.0.12
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
sha256sums_aarch64=('7265ecebf881ec4050d24fa4fac660ed86dfd11395fcde47b491dc084be1e61e')
sha256sums_x86_64=('c510956b92404a00f3054b4be0d378188f9f5217497555048de353b8f0e52d80')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/vercel-labs/fx/releases/download/v${pkgver}/fx-linux-x86_64.tar.gz")

latestver() {
    gh api repos/vercel-labs/fx/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/fx" "${pkgdir}/usr/bin/fx"
}
