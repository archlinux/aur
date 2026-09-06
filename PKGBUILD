# Maintainer: Tom Davenport <tom at tomdavenport dot co dot uk>

pkgname=create-egregore
pkgver=0.20.3
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
  'e619d0e3efc3fc1296884f0fd66d200addae60ff0189f63dc431cf044182addf'
  '209c1cd2733a2bc403232f439e185db49ff94b516190cd7b17c5a3d2c256dd80'
)

package() {
  npm install --global --prefix "${pkgdir}/usr" \
    "${srcdir}/${pkgname}-${pkgver}.tgz"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
