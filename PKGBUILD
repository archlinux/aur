# Maintainer: Trishan <mailtotrishan@gmail.com>
pkgname=porty-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern, aesthetic interactive port manager for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/trishan9/porty"
license=('MIT')
depends=()
provides=('porty')
conflicts=('porty')
source_x86_64=("${url}/releases/download/v${pkgver}/porty-linux-amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/porty-linux-arm64")
noextract=('porty-linux-amd64' 'porty-linux-arm64')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  cd "$srcdir"

  local binfile="porty-linux-amd64"
  if [[ "$CARCH" == "aarch64" ]]; then
    binfile="porty-linux-arm64"
  fi

  install -Dm755 "$binfile" "$pkgdir/usr/bin/porty"
}
