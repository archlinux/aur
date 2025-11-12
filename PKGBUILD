# Maintainer: Jack Mahoney <jacksmahoney@gmail.com>
pkgname=openai-codex-bin
pkgver=0.57.0
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
sha256sums_x86_64=('117b1fa75c659f50dcd09d3133cfe6520f4a9c5457ad90ac709d67a19eda358c')
sha256sums_aarch64=('6fbcccd413b1cf7db630455f373f534c7c00cba17eb1d1b77dd1df6454cf74dc')

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
