pkgname=mergerfs-tools-git
_pkgname=mergerfs-tools
pkgver=r67.0138e09
pkgrel=4
pkgdesc="Tools to help manage data in a mergerfs pool"
arch=('any')
url="https://github.com/trapexit/mergerfs-tools"
license=('ISC')
makedepends=('git')
depends=('python-xattr')
optdepends=('rsync: required for mergerfs.balance and mergerfs.dup')
source=("git+https://github.com/trapexit/mergerfs-tools")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
