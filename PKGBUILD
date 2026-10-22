# Maintainer: Daniel Perez

pkgname=entire-cli-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='Git-native AI agent session tracking'
arch=('x86_64' 'aarch64')
url='https://github.com/entireio/cli'
license=('MIT')
depends=('git')
provides=("entire-cli=$pkgver")
conflicts=('entire-cli')
options=('!debug')
source_x86_64=("entire-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/entire_linux_amd64.tar.gz")
source_aarch64=("entire-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/entire_linux_arm64.tar.gz")
sha256sums_x86_64=('28aa1664a990507c7063a9437aa896f3b1930447d03d3711a7d04629299bea18')
sha256sums_aarch64=('8d28db99ca781e7895588a321d96382053b00d50c2ae6a0373c2a7ea6974c3b4')

package() {
  install -Dm755 entire "$pkgdir/usr/bin/entire"
  install -Dm755 git-remote-entire "$pkgdir/usr/bin/git-remote-entire"
  install -Dm644 completions/entire.bash "$pkgdir/usr/share/bash-completion/completions/entire"
  install -Dm644 completions/entire.fish "$pkgdir/usr/share/fish/vendor_completions.d/entire.fish"
  install -Dm644 completions/entire.zsh "$pkgdir/usr/share/zsh/site-functions/_entire"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
