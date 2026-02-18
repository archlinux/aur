# Maintainer: Devan Huapaya hi@devan.gg
pkgname=prompter-cli
pkgver=2.0.1
pkgrel=1
pkgdesc="Prompt assembly tool for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/imdevan/prompter"
license=('MIT')
source=(
  "prompter-linux-amd64-${pkgver}::https://github.com/imdevan/prompter/releases/download/v2.0.1/prompter-linux-amd64"
  "prompter-linux-arm64-${pkgver}::https://github.com/imdevan/prompter/releases/download/v2.0.1/prompter-linux-arm64"
)
sha256sums=('a63ceafae142f19d10d932621313021890aec25ac8b27d1b8417c5887f738d15' 'a6ba1dda8116816c1ed01d574613b595f80bf68088f1b611830dfeadeb2c299c')

package() {
  case "${CARCH}" in
    x86_64)
      install -Dm755 "$srcdir/prompter-linux-amd64-${pkgver}" "$pkgdir/usr/bin/prompter"
      ;;
    aarch64)
      install -Dm755 "$srcdir/prompter-linux-arm64-${pkgver}" "$pkgdir/usr/bin/prompter"
      ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac
}
