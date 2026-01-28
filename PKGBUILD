#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=openai-codex-autoup-bin
pkgver=0.92.0
pkgrel=1
pkgdesc="Arch Linux package for OpenAI’s Codex CLI - Auto Updated"
arch=('x86_64' 'aarch64')
url="https://github.com/openai/codex"
license=('Apache')
provides=('openai-codex')
conflicts=('openai-codex' 'openai-codex-bin')
optdepends=(
  'git: for working with git repositories'
  'ripgrep: accelerated large-repo search'
)
keywords=('codex' 'openai' 'cli' 'ai' 'machine-learning' 'chatgpt')

source_x86_64=(
  "codex-${pkgver}-x86_64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums_x86_64=('320cb2d4168082954e2cd7022cd38c9dcaa2d60744d47e9cd00d0e6b8ae6fb3c')
sha256sums_aarch64=('d77df9c11b9eb6b75cd28304576fa06f1ec597d03e850bef0d24f91104601664')

source_aarch64=(
  "codex-${pkgver}-aarch64.tar.gz::https://github.com/openai/codex/releases/download/rust-v${pkgver}/codex-aarch64-unknown-linux-gnu.tar.gz"
)

package() {
  cd "$srcdir" || exit

  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "codex-x86_64-unknown-linux-gnu" "$pkgdir/usr/bin/codex"
  fi

  if [[ "$CARCH" == "aarch64" ]]; then
    install -Dm755 "codex-aarch64-unknown-linux-gnu" "$pkgdir/usr/bin/codex"
  fi
}
