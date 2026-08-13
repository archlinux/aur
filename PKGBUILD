# Maintainer: termer <termer@termer.net>

pkgname=friendnet-client-bin
pkgver=1.2.2
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
  "friendnet-client-linux_amd64-$pkgver.deb::https://github.com/termermc/FriendNet/releases/download/v1.2.2/friendnet-client-linux_amd64.deb"
)

sha256sums=('5f320daac16a5da40a9fbcb50a8b1f1e26186deda28fc081dd37480d42d252b2')

package() {
  cd "$srcdir"

  ar x friendnet-client-linux_amd64-$pkgver.deb

  tar -xzf data.tar.gz -C "$pkgdir"

  # Remove Debian-only metadata if present in payload
  rm -rf "$pkgdir/DEBIAN" "$pkgdir/debian-binary" 2>/dev/null || true
}
