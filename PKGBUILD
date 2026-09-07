# Maintainer: bermudi <github.igizp@dabg.uk>
# Auto-updated by GitHub Actions (see .github/workflows/opencode2-bin.yml)

pkgname=opencode2-bin
pkgver=0.0.0_beta_19213
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
sha512sums_x86_64=('ef694cda4a28e98eeb25c64db9fdd11315b1afad4bbe70c6b575b628b71a6dbc10e16ce385ec6a28281a8ed32daa5c7ba80a53f2afa45873613e45ac50388c61')
source_aarch64=("${pkgname}_${pkgver}_aarch64.tgz::https://registry.npmjs.org/@opencode-ai/cli-linux-arm64/-/cli-linux-arm64-${_npmver}.tgz")
sha512sums_aarch64=('60630b95ccf5d219fcaaab89561d45d11fdf0b056175ad617b104f0c95e9c088be1d96608e2faa95a4a9b07b53c5a6e5a895d814eb93d93c5faf01791025f6d4')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
}
