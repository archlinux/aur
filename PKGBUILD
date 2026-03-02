# Maintainer: Basecamp <support@basecamp.com>
pkgname=basecamp-cli
pkgver=0.2.1
pkgrel=1
pkgdesc="CLI for Basecamp project management"
arch=('x86_64' 'aarch64')
url="https://github.com/basecamp/basecamp-cli"
license=('MIT')
provides=('basecamp')
conflicts=('basecamp' 'basecamp-bin')
optdepends=(
  'bash-completion: for bash shell completions'
  'zsh: for zsh shell completions'
  'fish: for fish shell completions'
)
source_x86_64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.2.1/basecamp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.2.1/basecamp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0ffc537090b27c91a100ff785ce2a3050dec75f12df96e52ed6b41c009c2c53e')
sha256sums_aarch64=('f7bd60e40086e9952000667f28cbd7dd04e2abce23adb372012d6d49c7c256a4')

package() {
  install -Dm755 "basecamp" "${pkgdir}/usr/bin/basecamp"
  install -Dm644 "MIT-LICENSE" "${pkgdir}/usr/share/licenses/basecamp/MIT-LICENSE"
  install -Dm644 "completions/basecamp.bash" "${pkgdir}/usr/share/bash-completion/completions/basecamp"
  install -Dm644 "completions/_basecamp" "${pkgdir}/usr/share/zsh/site-functions/_basecamp"
  install -Dm644 "completions/basecamp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/basecamp.fish"
}
