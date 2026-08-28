pkgname=commit-ai
pkgver=1.6.0
pkgrel=2
pkgdesc="Generate Git commit messages using Gemini, OpenAI or any OpenAI-compatible provider with Gitmoji or Conventional Commits"
arch=('any')
url="https://jhowk14.github.io/commit-ai/"
license=('MIT')
depends=('git' 'jq' 'curl')

source=(
  "${pkgname}-${pkgver}.sh::https://raw.githubusercontent.com/jhowk14/commit-ai/v${pkgver}/any-linux/commit-ai.sh"
  "LICENSE"
)
sha256sums=(
  '4ffb354d2b177dde4259792ebec4ab54b6f2e43e4ba13e71b23ed9e378da8868'
  'aaa0316bacf7470c8b586093568a7a5a16ba8a19fa05f6a5d84dfa54876d874b'
)

package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}.sh" \
    "$pkgdir/usr/bin/commit-ai"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
