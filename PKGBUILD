# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-redis
pkgver=r36.90a0eae
pkgrel=1
pkgdesc='Redis client protocol support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-redis'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='90a0eae39d749290787a559dc89424afac2baa90'
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
