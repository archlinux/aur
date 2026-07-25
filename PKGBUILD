# Maintainer: Tom Davenport <tom at tomdavenport dot co dot uk>

pkgname=create-egregore
pkgver=0.19.13
pkgrel=1
pkgdesc='Set up Egregore shared cognition workspaces for Claude Code or Codex'
arch=('any')
url='https://egregore.xyz/'
license=('MIT')
depends=('git' 'nodejs>=18' 'npm')
optdepends=(
  'github-cli: first-party GitHub authentication path'
  'claude-code: Claude Code runtime'
  'openai-codex-bin: Codex runtime'
)
noextract=("${pkgname}-${pkgver}.tgz")
source=(
  "https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
  'LICENSE'
)
sha256sums=(
  'f9a39ed5657cc07157ca0901a9f9e0e05c368c2673ce733c7f703b59d2e2ec33'
  '209c1cd2733a2bc403232f439e185db49ff94b516190cd7b17c5a3d2c256dd80'
)

package() {
  npm install --global --prefix "${pkgdir}/usr" \
    "${srcdir}/${pkgname}-${pkgver}.tgz"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
