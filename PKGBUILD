# Maintainer: bermudi <github.igizp@dabg.uk>
# Auto-updated by GitHub Actions (see .github/workflows/opencode2-bin.yml)

pkgname=opencode2-bin
pkgver=0.0.0_beta_17498
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
sha512sums_x86_64=('3ef269e2b8e9fd3a6c113f31e8884b0c752e9d2fc3710f95f8a29e412611dc28e593d8fbcb6b7b96b314ec6581116111684e294587e212143d39054a8c837c17')
source_aarch64=("${pkgname}_${pkgver}_aarch64.tgz::https://registry.npmjs.org/@opencode-ai/cli-linux-arm64/-/cli-linux-arm64-${_npmver}.tgz")
sha512sums_aarch64=('01c0cd0bd5d7f4db348b5e522c0da70568b61d3b9c351b6389be15455b8d2ce29aeacd0af82931c72c3e14843db9e5019e7064b20e59df2eaf8151794487ba59')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
}
