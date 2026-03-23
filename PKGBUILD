pkgname=noon-mirsald
pkgver=r9.c8c5e93
pkgrel=1
pkgdesc="Noon native messaging host"
arch=("any")
url="https://github.com/pharmaracist/mirsal"
license=("MIT")
depends=("python3")
makedepends=("git")
provides=("noon-mirsald")
source=("noon-mirsald::git+https://github.com/pharmaracist/mirsal.git")
sha256sums=("SKIP")

pkgver() {
  cd noon-mirsald
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd noon-mirsald
  install -Dm755 aur/mirsald       "$pkgdir/usr/lib/noon-mirsal/mirsald"
  install -Dm755 aur/mirsal-cli    "$pkgdir/usr/bin/mirsal"
  install -Dm644 aur/protocol.py   "$pkgdir/usr/lib/noon-mirsal/protocol.py"
  install -Dm644 aur/noon_mirsal.json \
    "$pkgdir/usr/lib/mozilla/native-messaging-hosts/noon_mirsal.json"
}
