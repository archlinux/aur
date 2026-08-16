# Maintainer: bermudi <github.igizp@dabg.uk>
# Auto-updated by GitHub Actions (see .github/workflows/opencode2-bin.yml)

pkgname=opencode2-bin
pkgver=0.0.0_next_17444
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
sha512sums_x86_64=('cf20f35b96982114694998ae99fa1bd1fd1b7f788d4e793b1c633cebf8a2595de84b26d43b2f3cacefacd95dfb60cdadcc7faaa6f02c95863f75d829d6c5bd26')
source_aarch64=("${pkgname}_${pkgver}_aarch64.tgz::https://registry.npmjs.org/@opencode-ai/cli-linux-arm64/-/cli-linux-arm64-${_npmver}.tgz")
sha512sums_aarch64=('64d8525af05dc563533e1bc410080c2f69204badd4eb1e05e36c864059339dfb65d8f8bcef6204c183ecad7adbe8bc426c480188010ffc989537868d7c8d2346')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
}
