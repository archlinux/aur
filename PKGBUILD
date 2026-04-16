# Maintainer: Steve Clarke <steve@outport.dev>
pkgname=outport-bin
pkgver=0.41.0
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
sha256sums_x86_64=('040f81a1c90af1ac9ca7ad0e18149200c7df2140c8202abda6d7a2f2c97d44bc')
sha256sums_aarch64=('73ba5caf729fb87141287bfbee42827ac05d3441ddbdbdaf58fb29fa5aaeb35f')

package() {
    install -Dm755 outport "${pkgdir}/usr/bin/outport"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/outport.bash "${pkgdir}/usr/share/bash-completion/completions/outport"
    install -Dm644 completions/_outport "${pkgdir}/usr/share/zsh/site-functions/_outport"
    install -Dm644 completions/outport.fish "${pkgdir}/usr/share/fish/vendor_completions.d/outport.fish"
}
