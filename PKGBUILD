# Maintainer: Steve Clarke <sclarke77@gmail.com>
pkgname=outport-bin
pkgver=0.43.0
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
sha256sums_x86_64=('66dc0f1d9bd104e3dac8c332b3b1c198dbe6e97974da2f0a4df9d227012af40c')
sha256sums_aarch64=('9b180d0625e475ac35b8dc84eae80ffc05e3f9afbedd7b25414711af472c2cc9')

package() {
    install -Dm755 outport "${pkgdir}/usr/bin/outport"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completions/outport.bash "${pkgdir}/usr/share/bash-completion/completions/outport"
    install -Dm644 completions/_outport "${pkgdir}/usr/share/zsh/site-functions/_outport"
    install -Dm644 completions/outport.fish "${pkgdir}/usr/share/fish/vendor_completions.d/outport.fish"
}
