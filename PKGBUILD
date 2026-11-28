# Maintainer: Daniel Perez

pkgname=entire-cli-bin
pkgver=0.13.5
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
sha256sums_x86_64=('b32753f75e2b9deab57b501d790cec74878fca9df687acd3eded8e1248ba8b9f')
sha256sums_aarch64=('25f9ef3bf5ddd6d5ac0bb89410d0f60dba94239c63b0e046c60b8823203a6b49')

package() {
  install -Dm755 entire "$pkgdir/usr/bin/entire"
  install -Dm755 git-remote-entire "$pkgdir/usr/bin/git-remote-entire"
  install -Dm644 completions/entire.bash "$pkgdir/usr/share/bash-completion/completions/entire"
  install -Dm644 completions/entire.fish "$pkgdir/usr/share/fish/vendor_completions.d/entire.fish"
  install -Dm644 completions/entire.zsh "$pkgdir/usr/share/zsh/site-functions/_entire"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
