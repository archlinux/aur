# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-png
pkgver=r56.96a09c8
pkgrel=1
pkgdesc='PNG implementation for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-png'
license=('MPL2')
depends=('hare' 'hare-compress')
makedepends=('git')
_commit='96a09c8d50b49d0a11443b62e13f23b90f42c623'
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
