# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=bitwarden-cli-bin
_pkgname=bitwarden-cli
pkgver=1.16.0
pkgrel=1
pkgdesc='Natively packaged versions of the bitwarden cli'
arch=(x86_64)
url='https://github.com/bitwarden/cli'
license=('GPL3')
depends=('gcc-libs')
makedepends=()
options=(!strip)

source=(
  "https://github.com/bitwarden/cli/releases/download/v$pkgver/bw-linux-$pkgver.zip"
)

provides=('bitwarden-cli')
conflicts=('bitwarden-cli')

package() {
  install -Dm755 bw "$pkgdir/usr/bin/bw"
  "$pkgdir/usr/bin/bw" completion --shell zsh > completion 2> /dev/null
  install -Dm644 completion "$pkgdir/usr/share/zsh/vendor-completions/_bw"
}

sha512sums=('0566809bf302b6030f5a2190b6a2a13772dca052326e1b7f44ca1e801fa1b42538ca90f0f84aa289ac4507994d2ee8b20d621bb579d1f35561e7f28c11a5ade0')
# vim:set ts=2 sw=2 et:
