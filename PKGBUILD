# Maintainer: Daniel Perez

pkgname=entire-cli-bin
pkgver=0.13.2
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
sha256sums_x86_64=('fbcdb026cfdcdb0e6ea8405b9a2e6f3abf8047a26c31d71e16206a7dd9e85f4d')
sha256sums_aarch64=('bae5062def376ff57e8ad1568c5f8e218a7a8b3930908aceb021a8b1fe8f4719')

package() {
  install -Dm755 entire "$pkgdir/usr/bin/entire"
  install -Dm755 git-remote-entire "$pkgdir/usr/bin/git-remote-entire"
  install -Dm644 completions/entire.bash "$pkgdir/usr/share/bash-completion/completions/entire"
  install -Dm644 completions/entire.fish "$pkgdir/usr/share/fish/vendor_completions.d/entire.fish"
  install -Dm644 completions/entire.zsh "$pkgdir/usr/share/zsh/site-functions/_entire"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
