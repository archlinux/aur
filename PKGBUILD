pkgname=mergerfs-tools-git
_pkgname=mergerfs-tools
pkgver=r51.0de2e49
pkgrel=1
pkgdesc="Tools to help manage data in a mergerfs pool"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs-tools"
license=('MIT')
depends=('python-xattr' 'python2-xattr')
source=("git://github.com/trapexit/mergerfs-tools")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
