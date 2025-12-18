# Maintainer: Jack Mahoney <jacksmahoney@gmail.com>
pkgname=openai-codex-bin
pkgver=0.74.0
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
sha256sums_x86_64=('fb881fb21f1ad461563dbf2773bcace637e3b11e9ccb038fdbd676444ecaf09c')
sha256sums_aarch64=('58442efeae43d11e43d1ab3f83177129bdc7ad4cacf9b9a0311b0cc801c44730')

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
