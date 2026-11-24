# Maintainer: 37signals <support@37signals.com>
pkgname=hey-cli
pkgver=1.14.0
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
source_x86_64=("https://github.com/basecamp/hey-cli/releases/download/v1.14.0/hey_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/hey-cli/releases/download/v1.14.0/hey_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c41bcdf5854d69ae173937fcff0c6115ec81bbe5c2bfb5d7f3c27e69e1dd1b4b')
sha256sums_aarch64=('78a213438c6d6ba2a1a8652c559eb2d314fbb3328fd565d697993379f54246b1')

package() {
  install -Dm755 "hey" "${pkgdir}/usr/bin/hey"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "completions/hey.bash" "${pkgdir}/usr/share/bash-completion/completions/hey"
  install -Dm644 "completions/_hey" "${pkgdir}/usr/share/zsh/site-functions/_hey"
  install -Dm644 "completions/hey.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/hey.fish"
}
