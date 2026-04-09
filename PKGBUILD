# Maintainer: termer <termer@termer.net>

pkgname=friendnet-client-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Peer-to-peer file sharing client for the FriendNet protocol"
arch=("x86_64")
url="https://github.com/termermc/FriendNet"
license=("AGPL-3.0")
depends=()
makedepends=("binutils" "tar")
provides=("friendnet-client")
conflicts=()
options=(!debug)

source=(
  "friendnet-client-linux_amd64-$pkgver.deb::https://github.com/termermc/FriendNet/releases/download/v1.1.3/friendnet-client-linux_amd64.deb"
)

sha256sums=('576ba82abb946e3137ab5f662954605696702cd80dd81a8ce09f12fe4c977cf2')

package() {
  cd "$srcdir"

  ar x friendnet-client-linux_amd64-$pkgver.deb

  tar -xzf data.tar.gz -C "$pkgdir"

  # Remove Debian-only metadata if present in payload
  rm -rf "$pkgdir/DEBIAN" "$pkgdir/debian-binary" 2>/dev/null || true
}
