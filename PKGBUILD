# Maintainer: Basecamp <support@basecamp.com>
pkgname=basecamp-cli
pkgver=0.13.0
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
source_x86_64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.13.0/basecamp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.13.0/basecamp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('8b33a93018c165f82ac7050d83cad8cde509f9cb7cfbccbc48fb9d98c0649931')
sha256sums_aarch64=('bef69d622d66685899b4f955b255951bb588cf1aac54f990b6bd818ae551104c')

package() {
  install -Dm755 "basecamp" "${pkgdir}/usr/bin/basecamp"
  install -Dm644 "MIT-LICENSE" "${pkgdir}/usr/share/licenses/basecamp/MIT-LICENSE"
  install -Dm644 "completions/basecamp.bash" "${pkgdir}/usr/share/bash-completion/completions/basecamp"
  install -Dm644 "completions/_basecamp" "${pkgdir}/usr/share/zsh/site-functions/_basecamp"
  install -Dm644 "completions/basecamp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/basecamp.fish"
}
