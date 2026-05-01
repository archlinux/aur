# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=openai-codex-reasoning-bin
pkgver=0.128.0
pkgrel=1
pkgdesc="Prebuilt OpenAI Codex CLI fork with inline reasoning traces"
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

_fork_tag='aur-v0.128.0-reasoning.1'
_asset_name="${pkgname}-0.128.0-1-x86_64.tar.zst"
source=(
  "${_asset_name}::${url}/releases/download/v${pkgver}-${pkgrel}/${_asset_name}"
)
sha256sums=('d2c33443f3898353f92ff72112cd5a3833076bbcb0d9b55e2afeb68ddc877d2d')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}
