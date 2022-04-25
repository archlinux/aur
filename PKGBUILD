# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-redis
pkgver=r29.1f327b1
pkgrel=1
pkgdesc="Redis client protocol support for Hare"
arch=('any')
url="https://git.sr.ht/~sircmpwn/hare-redis"
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='1f327b19785df5f0d4f8fb6b0190d6296d8d06d8'
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
