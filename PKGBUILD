# Maintainer: bermudi <github.igizp@dabg.uk>
# Auto-updated by GitHub Actions (see .github/workflows/opencode2-bin.yml)

pkgname=opencode2-bin
pkgver=0.0.0_beta_19271
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
sha512sums_x86_64=('799c4d46cb44502c5893e2fa3eab59f0674b9c28bad3be8de3dd10022da963ddeaa83ebeaa0f7d385e41d63441176988ff2b1f0b35e5ad0b4b344f897f2b9745')
source_aarch64=("${pkgname}_${pkgver}_aarch64.tgz::https://registry.npmjs.org/@opencode-ai/cli-linux-arm64/-/cli-linux-arm64-${_npmver}.tgz")
sha512sums_aarch64=('d16233aaf7604d4c146902b971789b65ab866d15bb35972e5c6ac0f1d32c456980c8e34a0c29c8f4b6d25e2806c1cd5190679126b2ed3ff5f099cf1409e5e824')

package() {
  install -Dm755 "$srcdir/package/bin/opencode2" "$pkgdir/usr/bin/opencode2"
}
