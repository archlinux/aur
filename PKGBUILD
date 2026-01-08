# Maintainer: Jack Mahoney <jacksmahoney@gmail.com>
pkgname=openai-codex-bin
pkgver=0.79.0
pkgrel=1
pkgdesc="Lightweight coding agent that runs in your terminal (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex"
license=('Apache')
provides=('openai-codex')
conflicts=('openai-codex')
optdepends=(
   'git: for working with git repositories'
   'ripgrep: accelerated large-repo search'
)

source_x86_64=(
    "codex-${pkgver}-x86_64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('aa4a13dadc30ea6eb26da94e7b92e01834c1c04b5cf45af81c94d6f373d2f82d')
sha256sums_aarch64=('54063df807271fb5e44891c6475817563bf6d6acd517f9e0233c3b874e174da1')

source_aarch64=(
    "codex-${pkgver}-aarch64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-aarch64-unknown-linux-gnu.tar.gz"
)

package() {
    cd "$srcdir"

    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "codex-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/codex"
    fi

    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "codex-aarch64-unknown-linux-gnu" "$pkgdir/usr/bin/codex"
    fi
}
