# Maintainer: Steve Clarke <sclarke77@gmail.com>
pkgname=outport-bin
pkgver=0.45.0
pkgrel=1
pkgdesc="Dev port manager for multi-project, multi-worktree development"
arch=('x86_64' 'aarch64')
url="https://outport.dev"
license=('MIT')
depends=()
optdepends=('cloudflared: tunnel support for outport share')
provides=('outport')
conflicts=('outport')
source_x86_64=("https://github.com/steveclarke/outport/releases/download/v${pkgver}/outport_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/steveclarke/outport/releases/download/v${pkgver}/outport_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3ad99cd7032a332ed108050ab023baf0618815f0bd6788cfaaa24b6d3980d88b')
sha256sums_aarch64=('39a91ad484a367558ed7f9dd30964f4bc3104f56e6f20abc6751799d14115f56')

package() {
    install -Dm755 outport "${pkgdir}/usr/bin/outport"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/outport.bash "${pkgdir}/usr/share/bash-completion/completions/outport"
    install -Dm644 completions/_outport "${pkgdir}/usr/share/zsh/site-functions/_outport"
    install -Dm644 completions/outport.fish "${pkgdir}/usr/share/fish/vendor_completions.d/outport.fish"
}
