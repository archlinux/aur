# Maintainer: termer <termer@termer.net>

pkgname=friendnet-client-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="FriendNet Client"
arch=("x86_64")
url="https://github.com/termermc/FriendNet"
license=("AGPL-3.0")
depends=()
makedepends=("binutils" "tar")
provides=("friendnet-client")
conflicts=()

source=(
  "friendnet-client-linux_amd64.deb::https://github.com/termermc/FriendNet/releases/download/v${pkgver}/friendnet-client-linux_amd64.deb"
)

sha256sums=("SKIP")

package() {
  cd "$srcdir"

  ar x friendnet-client-linux_amd64.deb

  tar -xzf data.tar.gz -C "$pkgdir"

  # Rmove Debian-only metadata if present in payload
  rm -rf "$pkgdir/DEBIAN" "$pkgdir/debian-binary" 2>/dev/null || true
}
