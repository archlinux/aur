# Maintainer: bermudi <github.igizp@dabg.uk>
# Auto-updated by GitHub Actions (see .github/workflows/opencode2-bin.yml)

pkgname=opencode2-bin
pkgver=0.0.0_beta_19135
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
arch=('aarch64' 'x86_64')
url='https://opencode.ai'
license=('MIT')
provides=('opencode2')
conflicts=('opencode2')
depends=('glibc')
options=('!debug' '!strip')

# opencode v2 has no GitHub releases — it ships per-arch binaries to npm.
# The version is the `next` dist-tag of @opencode-ai/cli; upstream prerelease
# versions are `0.0.0-next-<build>` and the `-` maps to `_` for pkgver.
_npmver="${pkgver//_/-}"

# Update workflow rewrites pkgver, resets pkgrel, and rewrites the checksum
# entries below (hex sha512, derived from the npm `dist.integrity` field).
# Everything else here is static — do not hand-merge this file from a template.
source_x86_64=("${pkgname}_${pkgver}_x86_64.tgz::https://registry.npmjs.org/@opencode-ai/cli-linux-x64/-/cli-linux-x64-${_npmver}.tgz")
sha512sums_x86_64=('645daaa6eac6f869d6c5c298b15a80106499cbfbf0ccfe3dc856b58b6aab8ed0039afe9ab32614f6f8844681f907610bcf9b7a1f2105503acfc7f4decb6c89dd')
source_aarch64=("${pkgname}_${pkgver}_aarch64.tgz::https://registry.npmjs.org/@opencode-ai/cli-linux-arm64/-/cli-linux-arm64-${_npmver}.tgz")
sha512sums_aarch64=('9c9a15d06c6a526984c3f61b3bf835f35797db11d03b40a9d8b07379e29c403766bc7a78896d858dbc2540a460844ad5aede12d98d864546ceded27dbce8956f')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
}
