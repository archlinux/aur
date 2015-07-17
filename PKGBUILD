# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=snazzer-git
pkgver=r146.8d85449
pkgrel=1
pkgdesc="btrfs snapshotting and backup system offering snapshot measurement, transport and pruning. "
arch=('any')
url="https://github.com/csirac2/snazzer"
license=('BSD')
depends=('btrfs-progs')
source=("git+https://github.com/csirac2/snazzer.git")

pkgver() {
  cd "snazzer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/snazzer"
  install -Dm755 -t "$pkgdir/usr/bin/$script" snazzer snazzer-measure snazzer-prune-candidates snazzer-receive snazzer-send-wrapper
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -av doc/* "$pkgdir/usr/share/doc/$pkgname"
}
sha256sums=('SKIP')
