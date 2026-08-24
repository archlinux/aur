# Maintainer: 37signals <support@37signals.com>
pkgname=hey-cli
pkgver=0.2.2
pkgrel=1
pkgdesc="CLI for HEY email"
arch=('x86_64' 'aarch64')
url="https://github.com/basecamp/hey-cli"
license=('MIT')
provides=('hey')
conflicts=('hey' 'hey-bin')
optdepends=(
  'bash-completion: for bash shell completions'
  'zsh: for zsh shell completions'
  'fish: for fish shell completions'
)
source_x86_64=("https://github.com/basecamp/hey-cli/releases/download/v0.2.2/hey_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/hey-cli/releases/download/v0.2.2/hey_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('37d371a1162aff39de5973cb8d47aaabe5eb3d3f6e3afd2a9e2f3a82d278c56b')
sha256sums_aarch64=('92c57724ff7630db49c487cb38896797cd7fb046189eb421d469e77c43714254')

package() {
  install -Dm755 "hey" "${pkgdir}/usr/bin/hey"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "completions/hey.bash" "${pkgdir}/usr/share/bash-completion/completions/hey"
  install -Dm644 "completions/_hey" "${pkgdir}/usr/share/zsh/site-functions/_hey"
  install -Dm644 "completions/hey.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/hey.fish"
}
