# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-xml
pkgver=r41.2214874
pkgrel=1
pkgdesc="XML support for Hare"
arch=('any')
url="https://git.sr.ht/~sircmpwn/hare-xml"
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='221487482aa18dca9af5cf7bd5a92fe4c9cc8623'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$pkgname"

  make check
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
