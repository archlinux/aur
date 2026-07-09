# Maintainer: SmallClover <aur at clvr dot one>

pkgname=bdcli-bin
pkgver=0.3.1
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

sha256sums_x86_64=('77c39eecd4b3eba0a27f5a3806a23d6be7a21f961afda661374ff8223ffefeab')
sha256sums_aarch64=('84eb6b8c4d3037e3890638d583d7c10f0c40f8eebe2b0a680c5c30fddea757f4')

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 bdcli "$pkgdir/usr/bin/bdcli"

  # Install shell completions
  install -Dm644 completions/bdcli.bash "$pkgdir/usr/share/bash-completion/completions/bdcli"
  install -Dm644 completions/bdcli.fish "$pkgdir/usr/share/fish/vendor_completions.d/bdcli.fish"
  install -Dm644 completions/bdcli.zsh "$pkgdir/usr/share/zsh/site-functions/_bdcli"
}
