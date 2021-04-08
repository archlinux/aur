# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=bitwarden-cli-bin
_pkgname=bitwarden-cli
pkgver=1.15.1
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

sha512sums=('ae122984d368f4fc5af9a709fd4d2201521b9fb30d241a22178e37a0e8e016b7ebf408a27492a982811405af2615e09e94de9eca82cdb0026cc43bc7167e1000')
# vim:set ts=2 sw=2 et:
