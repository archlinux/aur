# Maintainer: Basecamp <support@basecamp.com>
pkgname=basecamp-cli
pkgver=0.24.3
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
source_x86_64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.24.3/basecamp_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/basecamp-cli/releases/download/v0.24.3/basecamp_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('75b4491db95a78611d051c119e5f390e44a1b7d8504f8f7ee3cba67eae7b6bef')
sha256sums_aarch64=('4240cc4fa67a150048a3d260fa702ad5af438768eca4e0b628cdd8e2aed28859')

package() {
  install -Dm755 "basecamp" "${pkgdir}/usr/bin/basecamp"
  install -Dm644 "MIT-LICENSE" "${pkgdir}/usr/share/licenses/basecamp/MIT-LICENSE"
  install -Dm644 "completions/basecamp.bash" "${pkgdir}/usr/share/bash-completion/completions/basecamp"
  install -Dm644 "completions/_basecamp" "${pkgdir}/usr/share/zsh/site-functions/_basecamp"
  install -Dm644 "completions/basecamp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/basecamp.fish"
}
