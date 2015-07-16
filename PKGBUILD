# Maintainer: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
pkgname=tlocate
pkgver=r30.6f5f385
pkgrel=1
pkgdesc="mlocate rewritten using only GNU coreutils, sudo and bash with proper btrfs subvolume handling, semi-arbitrary filtering and other improvements"
arch=('any')
url="https://github.com/crossroads1112/tlocate"
license=('GPL')
depends=()
makedepends=('git')
source=(git+https://github.com/crossroads1112/tlocate.git)
md5sums=(SKIP)

pkgver() {
  cd "tlocate"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/tlocate"
  install -Dm0755 tlocate            "$pkgdir/usr/bin/tlocate"
  install -Dm0644 tlocate.conf       "$pkgdir/etc/tlocate.conf"
}
