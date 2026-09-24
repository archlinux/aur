# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fx-agent-bin
pkgver=0.0.11
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
sha256sums_aarch64=('0067d2156ac31956f52bb0b7b69722733d2756a373f47c4456681b1490b458fe')
sha256sums_x86_64=('0438a067df1e2b0e2d85f1e018795b7fe5a4b5fafb37f4a590a733917e53943b')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/vercel-labs/fx/releases/download/v${pkgver}/fx-linux-x86_64.tar.gz")

latestver() {
    gh api repos/vercel-labs/fx/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    install -Dm755 "${srcdir}/fx" "${pkgdir}/usr/bin/fx"
}
