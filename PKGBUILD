# Maintainer: termer <termer@termer.net>

pkgname=friendnet-client-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Peer-to-peer file sharing client for the FriendNet protocol"
arch=("x86_64")
url="https://github.com/termermc/FriendNet"
license=("GPL-3.0")
depends=()
makedepends=("binutils" "tar")
provides=("friendnet-client")
conflicts=()
options=(!debug)

source=(
  "friendnet-client-linux_amd64-$pkgver.deb::https://github.com/termermc/FriendNet/releases/download/v1.2.1/friendnet-client-linux_amd64.deb"
)

sha256sums=('62c07a6974f6afa80b7667e1575093b21464025978d315789bb71a759365c233')

package() {
  cd "$srcdir"

  ar x friendnet-client-linux_amd64-$pkgver.deb

  tar -xzf data.tar.gz -C "$pkgdir"

  # Remove Debian-only metadata if present in payload
  rm -rf "$pkgdir/DEBIAN" "$pkgdir/debian-binary" 2>/dev/null || true
}
