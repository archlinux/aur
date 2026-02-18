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
sha256sums=('344b549cda5df3a23516e2a755f11cd0bbfaa9204190a507677f497ad81f57d8' 'acf89b8dfa642e7270404219a10bc9ca3f1e9ee0d9c789a5bc76c30ac8f8291b')

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
