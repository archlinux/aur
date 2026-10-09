# Maintainer: Dinesh Jinjala <jinjaladinesh@gmail.com>
pkgname=taskhub-cli-bin
pkgver=0.1.1
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
sha256sums_x86_64=('3f0d34263f734f00a00850f5f2a6030d521737eaa083e95d404b7bb86a46308d')
sha256sums_aarch64=('5458ac3671d39b4579809b08a931d7544948f5e164e38edf007b4ecdfcd2aac9')

package() {
  cd "taskhub-cli-${CARCH}-unknown-linux-musl"
  install -Dm755 taskhub "$pkgdir/usr/bin/taskhub"
  install -Dm644 taskhub.1 "$pkgdir/usr/share/man/man1/taskhub.1"
  install -Dm644 completions/taskhub.bash "$pkgdir/usr/share/bash-completion/completions/taskhub"
  install -Dm644 completions/_taskhub "$pkgdir/usr/share/zsh/site-functions/_taskhub"
  install -Dm644 completions/taskhub.fish "$pkgdir/usr/share/fish/vendor_completions.d/taskhub.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
