# Maintainer: SmallClover <belitzlars at gmail dot com>

pkgname=bdcli-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI for installing and managing BetterDiscord "
arch=('x86_64' 'aarch64')
url="https://github.com/BetterDiscord/cli"
license=('Apache-2.0')
provides=('bdcli')
conflicts=('bdcli' 'bdcli-git')
depends=()
options=(!strip)

source_x86_64=("https://github.com/BetterDiscord/cli/releases/download/v${pkgver}/bdcli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/BetterDiscord/cli/releases/download/v${pkgver}/bdcli_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('b4eaad572c0d0445d7e305cb045122a27aacb2c2b6e862130a6def00580b5268')
sha256sums_aarch64=('530628185609a121f57c7af9818000ce2735b611d432f936b2a55e595b9dc1bc')

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 bdcli "$pkgdir/usr/bin/bdcli"

  # Install shell completions
  install -Dm644 completions/bdcli.bash "$pkgdir/usr/share/bash-completion/completions/bdcli"
  install -Dm644 completions/bdcli.fish "$pkgdir/usr/share/fish/vendor_completions.d/bdcli.fish"
  install -Dm644 completions/bdcli.zsh "$pkgdir/usr/share/zsh/site-functions/_bdcli"
}