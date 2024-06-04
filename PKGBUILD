# Maintainer: Celestial.y <celestial.y at outlook dot com>

pkgname=butter-snap-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Bash-based tool for automating Btrfs snapshots."
arch=(any)
url=https://github.com/clsty/butter-snap
license=(GPL-3.0-only)
depends=(btrfs-progs bash)
optdepends=('cronie: cronjob support')
makedepends=('git')
provides=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  printf "%s" "$(git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  install -Dm755 "$pkgname/buttersnap" -t "$pkgdir/usr/bin"
}
