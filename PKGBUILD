# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=updatecli-bin
pkgver="0.43.0"
pkgrel=1
pkgdesc="A Declarative Dependency Management tool"
arch=(x86_64 aarch64)
url="https://github.com/updatecli/updatecli"
license=("Apache")
depends=()
makedepends=("git")
optdepends=()
provides=(updatecli)
source_x86_64=("https://github.com/updatecli/updatecli/releases/download/v${pkgver}/updatecli_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/updatecli/updatecli/releases/download/v${pkgver}/updatecli_Linux_arm64.tar.gz")
sha256sums_x86_64=("bfbea0f416c72cb6c94ddb3c91b54fec2232a5f89ef47536fc25e7780e10c2ba")
sha256sums_aarch64=("edce38a5fd4deb2842767c3de1354b0075e04dbecfe5c1248544e2f7efb0589d")

package() {
  cd "$srcdir"

  install -Dm755 updatecli "$pkgdir/usr/bin/updatecli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 manpages/updatecli.1.gz "$pkgdir/usr/share/man/man1/updatecli.1.gz"
  install -Dm644 completions/updatecli.bash "$pkgdir/usr/share/bash-completion/completions/updatecli"
  install -Dm644 completions/updatecli.fish "$pkgdir/usr/share/fish/vendor_completions.d/updatecli.fish"
  install -Dm644 completions/updatecli.zsh "$pkgdir/usr/share/zsh/site-functions/_updatecli"
}
