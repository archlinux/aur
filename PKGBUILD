pkgname=mergerfs-tools-git
_pkgname=mergerfs-tools
pkgver=r65.d84aadb
pkgrel=1
pkgdesc="Tools to help manage data in a mergerfs pool"
arch=('any')
url="https://github.com/trapexit/mergerfs-tools"
license=('ISC')
makedepends=('git')
depends=('python-xattr' 'python2-xattr' 'rsync')
source=("git://github.com/trapexit/mergerfs-tools")
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
