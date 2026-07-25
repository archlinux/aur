# Maintainer: termer <termer@termer.net>

pkgname=friendnet-client-bin
pkgver=1.2.0
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
  "friendnet-client-linux_amd64-$pkgver.deb::https://github.com/termermc/FriendNet/releases/download/v1.2.0/friendnet-client-linux_amd64.deb"
)

sha256sums=('7c183ac875a540cad7c18aeb4b339105514fae4a1a44f504b8deed113a704890')

package() {
  cd "$srcdir"

  ar x friendnet-client-linux_amd64-$pkgver.deb

  tar -xzf data.tar.gz -C "$pkgdir"

  # Remove Debian-only metadata if present in payload
  rm -rf "$pkgdir/DEBIAN" "$pkgdir/debian-binary" 2>/dev/null || true
}
