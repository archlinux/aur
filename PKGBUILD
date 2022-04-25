# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-png
pkgver=r53.47bbe9c
pkgrel=1
pkgdesc="PNG implementation for Hare"
arch=('any')
url="https://git.sr.ht/~sircmpwn/hare-png"
license=('MPL2')
depends=('hare' 'hare-compress')
makedepends=('git')
_commit='47bbe9c46b993e2dbc7042398c931b7d6e9d5b59'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
