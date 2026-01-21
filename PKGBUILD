# Maintainer: Jose Carlos Leira <jcleira@gmail.com>
pkgname=workspace-cli-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI tool for managing isolated development workspaces with git"
arch=('x86_64' 'aarch64')
url="https://github.com/jcleira/workspace"
license=('MIT')
depends=('git')
optdepends=(
    'zsh: for zsh shell integration'
    'bash-completion: for bash completion support'
    'fish: for fish shell completion'
)
provides=('workspace')
conflicts=('workspace')
source_x86_64=("${url}/releases/download/v${pkgver}/workspace_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/workspace_Linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 workspace "${pkgdir}/usr/bin/workspace"

    install -Dm644 completions/workspace.bash \
        "${pkgdir}/usr/share/bash-completion/completions/workspace"
    install -Dm644 completions/workspace.zsh \
        "${pkgdir}/usr/share/zsh/site-functions/_workspace"
    install -Dm644 completions/workspace.fish \
        "${pkgdir}/usr/share/fish/vendor_completions.d/workspace.fish"
}
