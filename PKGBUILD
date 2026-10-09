# Maintainer: Dinesh Jinjala <jinjaladinesh@gmail.com>
pkgname=taskhub-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line client and MCP server for TaskHub"
arch=('x86_64' 'aarch64')
url="https://github.com/MachineLearning-Nerd/taskhub-cli"
license=('MIT')
provides=('taskhub-cli')
# 'taskhub' is an unrelated AUR to-do app that also installs /usr/bin/taskhub.
conflicts=('taskhub-cli' 'taskhub')
options=('!strip' '!debug')
source_x86_64=("https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v${pkgver}/taskhub-cli-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("https://github.com/MachineLearning-Nerd/taskhub-cli/releases/download/v${pkgver}/taskhub-cli-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('2b34808fcb27178978219d10ecb2c8a2d3cd580a407b58dcdf7f83364761d2a9')
sha256sums_aarch64=('2d137ff7c4038b964ace0a8134da0d6660645288211fee3efd58516fce31d1a0')

package() {
  cd "taskhub-cli-${CARCH}-unknown-linux-musl"
  install -Dm755 taskhub "$pkgdir/usr/bin/taskhub"
  install -Dm644 taskhub.1 "$pkgdir/usr/share/man/man1/taskhub.1"
  install -Dm644 completions/taskhub.bash "$pkgdir/usr/share/bash-completion/completions/taskhub"
  install -Dm644 completions/_taskhub "$pkgdir/usr/share/zsh/site-functions/_taskhub"
  install -Dm644 completions/taskhub.fish "$pkgdir/usr/share/fish/vendor_completions.d/taskhub.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
