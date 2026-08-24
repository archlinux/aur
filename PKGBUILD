# Maintainer: 37signals <support@37signals.com>
pkgname=hey-cli
pkgver=1.0.0
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
source_x86_64=("https://github.com/basecamp/hey-cli/releases/download/v1.0.0/hey_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/hey-cli/releases/download/v1.0.0/hey_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('443787075ed333390f51ee755486c2b72248c8a20dafde820c769dcf18a27350')
sha256sums_aarch64=('92ec29f1cece74e21a26abf3e81013547fb87e28f81c92f9b341c2f21a8472a3')

package() {
  install -Dm755 "hey" "${pkgdir}/usr/bin/hey"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "completions/hey.bash" "${pkgdir}/usr/share/bash-completion/completions/hey"
  install -Dm644 "completions/_hey" "${pkgdir}/usr/share/zsh/site-functions/_hey"
  install -Dm644 "completions/hey.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/hey.fish"
}
