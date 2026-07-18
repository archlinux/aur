# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=openai-codex-reasoning-bin
pkgver=0.144.6
pkgrel=1
pkgdesc="Prebuilt OpenAI Codex CLI with raw reasoning traces enabled by default"
arch=('x86_64')
url="https://github.com/OneNoted/openai-codex-reasoning-bin"
license=('Apache-2.0')
depends=(
  'openssl'
  'gcc-libs'
  'glibc'
)
optdepends=(
  'git: built-in PR helpers'
  'ripgrep: accelerated large-repo search'
)
provides=(
  'openai-codex'
  'openai-codex-reasoning'
)
conflicts=(
  'openai-codex'
  'openai-codex-bin'
  'openai-codex-reasoning'
)
replaces=('openai-codex-reasoning')

_asset_name="${pkgname}-0.144.6-1-x86_64.tar.zst"
source=(
  "${_asset_name}::${url}/releases/download/v${pkgver}-${pkgrel}/${_asset_name}"
)
sha256sums=('7ca0e8fe6b5314252ca25d67b280511f863e013b41787e2ccf6ca62739fb0640')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}
