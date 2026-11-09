# Maintainer: 37signals <support@37signals.com>
pkgname=hey-cli
pkgver=1.13.0
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
source_x86_64=("https://github.com/basecamp/hey-cli/releases/download/v1.13.0/hey_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/hey-cli/releases/download/v1.13.0/hey_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('eb2c05d7be1cd117023cd152476a92058975cb920a7a113d9c80ce8f407b9094')
sha256sums_aarch64=('d83c2c367054d4c82f442e0753606f14d13d4752e1fa63b159a2fb296a8b258e')

package() {
  install -Dm755 "hey" "${pkgdir}/usr/bin/hey"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "completions/hey.bash" "${pkgdir}/usr/share/bash-completion/completions/hey"
  install -Dm644 "completions/_hey" "${pkgdir}/usr/share/zsh/site-functions/_hey"
  install -Dm644 "completions/hey.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/hey.fish"
}
