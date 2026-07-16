# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=openai-codex-reasoning-bin
pkgver=0.144.5
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

_asset_name="${pkgname}-0.144.5-1-x86_64.tar.zst"
source=(
  "${_asset_name}::${url}/releases/download/v${pkgver}-${pkgrel}/${_asset_name}"
)
sha256sums=('bd889d1645d3508926b16fe0a19a2b5c32b861388105351f327629a6216c9e72')

package() {
  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}"
}
