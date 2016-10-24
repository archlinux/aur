# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=snazzer-git
pkgver=r179.a6577cf
pkgrel=1
pkgdesc="btrfs snapshotting and backup system offering snapshot measurement, transport and pruning. "
arch=('any')
url="https://github.com/csirac2/snazzer"
license=('BSD')
depends=('btrfs-progs')
makedepends=('git')
source=("git+https://github.com/csirac2/snazzer.git")

pkgver() {
  cd "snazzer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Requires sudo currently
#check() {
#  cd "$srcdir/snazzer"
#
#  make test
#}

package() {
  cd "$srcdir/snazzer"

  make INSTALL_PREFIX="$pkgdir/usr/" install
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
sha256sums=('SKIP')
