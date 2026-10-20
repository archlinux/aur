# Maintainer: Basecamp <support@basecamp.com>
pkgname=basecamp-cli
pkgver=0.14.0
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
source_x86_64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.14.0/basecamp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.14.0/basecamp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('53b5dd7755aebbdec7f83f8c93013f14f0244c9c86bbbf68ffda9df9962ec6dd')
sha256sums_aarch64=('bb61ba04331b2e7a961f4649b2c1b592f50ec4b875981afebe0ef8e5763e459e')

package() {
  install -Dm755 "basecamp" "${pkgdir}/usr/bin/basecamp"
  install -Dm644 "MIT-LICENSE" "${pkgdir}/usr/share/licenses/basecamp/MIT-LICENSE"
  install -Dm644 "completions/basecamp.bash" "${pkgdir}/usr/share/bash-completion/completions/basecamp"
  install -Dm644 "completions/_basecamp" "${pkgdir}/usr/share/zsh/site-functions/_basecamp"
  install -Dm644 "completions/basecamp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/basecamp.fish"
}
