# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=openai-codex-reasoning-bin
pkgver=0.142.2
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

_asset_name="${pkgname}-0.142.2-1-x86_64.tar.zst"
source=(
  "${_asset_name}::${url}/releases/download/v${pkgver}-${pkgrel}/${_asset_name}"
)
sha256sums=('6feea916c18dce272463bdc4c6f064b81c41ca71d2c4b8e81bbf2a3980d824ac')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}
