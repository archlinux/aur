# Maintainer: termer <termer@termer.net>

pkgname=friendnet-client-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="FriendNet Client"
arch=("x86_64")
url="https://github.com/termermc/FriendNet"
license=("AGPL-3.0")
depends=()
makedepends=("binutils" "tar")
provides=("friendnet-client")
conflicts=()
options=(!debug)

source=(
  "friendnet-client-linux_amd64-$pkgver.deb::https://github.com/termermc/FriendNet/releases/download/v1.1.2/friendnet-client-linux_amd64.deb"
)

sha256sums=('12e7926bfd27008066ef04dab1b9c1c0557f84c6ad7b6767218f7d83c08cffd0')

package() {
  cd "$srcdir"

  ar x friendnet-client-linux_amd64-$pkgver.deb

  tar -xzf data.tar.gz -C "$pkgdir"

  # Remove Debian-only metadata if present in payload
  rm -rf "$pkgdir/DEBIAN" "$pkgdir/debian-binary" 2>/dev/null || true
}
