# Maintainer: 37signals <support@37signals.com>
pkgname=hey-cli
pkgver=1.12.0
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
source_x86_64=("https://github.com/basecamp/hey-cli/releases/download/v1.12.0/hey_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/basecamp/hey-cli/releases/download/v1.12.0/hey_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ea9c369d428006e55694aed0db816d0d973c3ac302e90f1e63d0bad615c83d69')
sha256sums_aarch64=('7deaa39ec26535c40dc754c5d8d578ff3629076072e105cf7a692933f100f861')

package() {
  install -Dm755 "hey" "${pkgdir}/usr/bin/hey"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -Dm644 "completions/hey.bash" "${pkgdir}/usr/share/bash-completion/completions/hey"
  install -Dm644 "completions/_hey" "${pkgdir}/usr/share/zsh/site-functions/_hey"
  install -Dm644 "completions/hey.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/hey.fish"
}
