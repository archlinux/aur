# Maintainer: Steve Clarke <sclarke77@gmail.com>
pkgname=outport-bin
pkgver=0.42.0
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
sha256sums_x86_64=('9ab2c7910f76a7912adfbd94ff7d798361e20bc6be24468485ce2ae709cd80d8')
sha256sums_aarch64=('c5b8854e28a364f096ccfdeca3627e11aca7620193e6a2be06c5f4eb8d3896eb')

package() {
    install -Dm755 outport "${pkgdir}/usr/bin/outport"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/outport.bash "${pkgdir}/usr/share/bash-completion/completions/outport"
    install -Dm644 completions/_outport "${pkgdir}/usr/share/zsh/site-functions/_outport"
    install -Dm644 completions/outport.fish "${pkgdir}/usr/share/fish/vendor_completions.d/outport.fish"
}
