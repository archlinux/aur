# Maintainer: SmallClover <aur at clvr dot one>

pkgname=bdcli-bin
pkgver=1.0.0
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

sha256sums_x86_64=('df0a97f64be42abed3bb534c7770207ca78f79e5f82eaeb6027f2cbd46e0df44')
sha256sums_aarch64=('317c607294fa95fda694d33796a693b49433f7496e10e3845120a6de432b3a5c')

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 bdcli "$pkgdir/usr/bin/bdcli"

  # Install shell completions
  install -Dm644 completions/bdcli.bash "$pkgdir/usr/share/bash-completion/completions/bdcli"
  install -Dm644 completions/bdcli.fish "$pkgdir/usr/share/fish/vendor_completions.d/bdcli.fish"
  install -Dm644 completions/bdcli.zsh "$pkgdir/usr/share/zsh/site-functions/_bdcli"
}
